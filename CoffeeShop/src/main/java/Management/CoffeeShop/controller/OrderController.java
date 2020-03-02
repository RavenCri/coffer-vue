package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.GoodOrder;
import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.service.IGoodOrderService;
import Management.CoffeeShop.service.IGoodsService;
import Management.CoffeeShop.service.IVipService;
import Management.CoffeeShop.service.impl.GoodOrderServiceImpl;
import Management.CoffeeShop.websocket.WebSocketServer;
import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.xml.crypto.Data;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

@Controller
@RequestMapping("order")
public class OrderController {
    static List<ArrayList<Integer>> shoppringCar = new ArrayList();
    @Autowired
    IGoodOrderService goodOrderService;
    @Autowired
    IGoodsService goodsService;
    @Autowired
    IVipService vipService;
    // 取货号码
    private static int takeGoodIndex = 100;
    @PostMapping("addPay")
    @ResponseBody
    public JSONObject addPay(@RequestBody JSONObject jsonObject){
        List<Integer> orderId = new ArrayList();
        JSONObject res = new JSONObject();
        JSONArray result = new JSONArray();

        JSONObject param = jsonObject.getJSONObject("param");
        JSONObject price = param.getJSONObject("price");
        Goods good = goodsService.findGoodByName(param.getString("name"));
        int buyNum = param.getInteger("buyNum");
        String cupType = param.getString("cupType");
        DecimalFormat    df   = new DecimalFormat("######0.00");
        double money  = Double.valueOf(df.format(Double.valueOf(price.getString(cupType))*buyNum));
        String create_time = new DateTime().toString();
        String commodity_specification = param.getString("cupType")+"#"+param.getString("sweetNess");
        // 会员id
        String vipId = param.getString("vipId")==null?"0":param.getString("vipId");
        double fmoney = money ;
        System.out.println("vipId"+vipId);
        int order_status = 0;
        Vip vip = null;
        // 如果登陆了
        if(!vipId.equals("0")){
             vip = vipService.vipLogin(vipId);
            // 防止前端伪造数据
            if(vip !=null){
                double money_disc = vip.getMoney_disc();
                fmoney=Double.valueOf(df.format(money*money_disc));
                if(vip.getVmoney() < fmoney){
                    res.put("status","error");
                    res.put("msg","余额不足");
                    return res;
                }
                //订单增加会员积分
                vip.setCredit(vip.getCredit()+30);
                vipService.updateVipInfo(vip);
                order_status = 1;

                res.put("takeGoodIndex",++takeGoodIndex);
                vip.setVmoney(vip.getVmoney()-fmoney);
                vipService.updateMoney(vip.getVmoney(),vip);
            }
        }

        GoodOrder goodOrder = new GoodOrder(0,vipId,buyNum,money,fmoney,create_time,good,commodity_specification,order_status);

        goodOrderService.addOrder(goodOrder);
        JSONObject noticeMsg = new JSONObject();
        JSONObject data = JSONObject.parseObject(JSON.toJSONString(goodOrder));
        if(vip != null){
            data.put("customer",vip.getVname());
        }else{
            data.put("customer","游客");
        }

        noticeMsg.put("data",data.toJSONString());
        noticeMsg.put("msgType","newOrder");
        WebSocketServer.sendInfo(noticeMsg.toJSONString());
        result.add(goodOrder.getBid());
        res.put("result",result);

        res.put("status","success");
        res.put("msg","订单已提交");
        return res;
    }
    @RequestMapping("/selectOrderByVipId")
    @ResponseBody
    public JSONArray selectOrderByVipId(@RequestBody JSONObject json){
        String vipId = json.getString("vipId");
        List<GoodOrder> goodOrders = goodOrderService.selectOrderByVipId(vipId);
       JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(goodOrders));
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject curr = jsonArray.getJSONObject(i);


            curr.put("createdTime",curr.getString("created_time"));
            curr.put("goodName",curr.getJSONObject("good").getString("name"));
            String commodity_specification = curr.getString("commodity_specification");
            String[] split = commodity_specification.split("#");
            curr.put("cupType",cupTypeChinese(split[0]) );
            curr.put("goodNess",goodNessChinese(split[1]) );
            System.out.println(curr);
        }
        return jsonArray;
    }

    @RequestMapping("/selectOrderById")
    @ResponseBody
    public String selectOrderById(@RequestBody JSONObject json){
        int id = json.getInteger("id");
        GoodOrder goodOrder = goodOrderService.selectOrderById(id);
        return JSON.toJSONString(goodOrder);

    }

    @PostMapping("addPays")
    @ResponseBody
    public JSONObject addPays(@RequestBody JSONObject jsonObject){
        List<Integer> orderId = new ArrayList();
        JSONObject res = new JSONObject();
        JSONArray result = new JSONArray();
        jsonObject = jsonObject.getJSONObject("param");
        JSONArray param = jsonObject.getJSONArray("param");
        // 会员id
        String vipId = jsonObject.getString("vipId")==null?"0":jsonObject.getString("vipId");
        boolean vipLoginStatus = false;
        Vip vip = null;
        if(!vipId.equals("0")) {
            vip = vipService.vipLogin(vipId);
            if(vip !=null){
                vipLoginStatus = true;
            }
        }
        DecimalFormat    df   = new DecimalFormat("######0.00");
        double checkMoneyNum = 0;

        for (int i = 0; i < param.size(); i++) {
            JSONObject curr = param.getJSONObject(i);
            JSONObject price = curr.getJSONObject("price");
            int buyNum = curr.getInteger("buyNum");
            String cupType = curr.getString("cupType");
            if(vipLoginStatus){
                //订单增加积分
                vip.setCredit(vip.getCredit()+30);
                vipService.updateVipInfo(vip);
            }

            checkMoneyNum += Double.valueOf(df.format(Double.valueOf(price.getString(cupType))*buyNum));

        }
        if(vipLoginStatus){
            if(vip.getVmoney()<checkMoneyNum){
                res.put("status","error");
                res.put("msg","余额不足");
                return res;
            }
        }
        ArrayList<Integer> temp = new ArrayList();
        for (int i = 0; i < param.size(); i++) {
            JSONObject curr = param.getJSONObject(i);
            JSONObject price = curr.getJSONObject("price");
            Goods good = goodsService.findGoodByName(curr.getString("name"));
            int buyNum = curr.getInteger("buyNum");
            String cupType = curr.getString("cupType");

            double money  = Double.valueOf(df.format(Double.valueOf(price.getString(cupType))*buyNum));
            String create_time =  new DateTime().toString();
            String commodity_specification = curr.getString("cupType")+"#"+curr.getString("sweetNess");
            double fmoney = money;
            int order_status = 0;
            // 如果登陆了
            if(vipLoginStatus) {
                double money_disc = vip.getMoney_disc();
                fmoney=Double.valueOf(df.format(money*money_disc));

                vip.setVmoney(vip.getVmoney()-fmoney);
                vipService.updateMoney(vip.getVmoney(),vip);
                order_status = 1;
            }
            GoodOrder goodOrder = new GoodOrder(0,vipId,buyNum,money,fmoney,create_time,good,commodity_specification,order_status);
            goodOrderService.addOrder(goodOrder);
            temp.add(goodOrder.getBid());
            // 添加一个单号就行了 判断一个付款成功，该购物车的其他订单就都审核了
            if(i==0){

                result.add(goodOrder.getBid());
            }
        }
        shoppringCar.add(temp);
        JSONObject noticeMsg = new JSONObject();
        noticeMsg.put("msgType","newOrders");
        WebSocketServer.sendInfo(noticeMsg.toJSONString());
        if(vipLoginStatus){

            res.put("takeGoodIndex",++takeGoodIndex);
        }
        res.put("result",result);
        res.put("status","success");
        res.put("msg","订单已提交");
        return res;

    }

    @PostMapping("cancelOrder")
    @ResponseBody
    public JSONObject cancelOrder(@RequestBody JSONObject jsonObject){
        JSONObject res = new JSONObject();
        try{
            ArrayList<Integer> array = (ArrayList)jsonObject.get("param");

            array.forEach(i-> {

                goodOrderService.updateOrder(i,-1);
            });
            JSONObject noticeMsg = new JSONObject();

            noticeMsg.put("msgType","cancelOrder");
            WebSocketServer.sendInfo(noticeMsg.toJSONString());
            return res.fluentPut("status","success");
        }catch (Exception e){
            res.fluentPut("msg",e.getMessage());
            return res.fluentPut("status","success");
        }

    }
    @GetMapping("getAllOrder")
    @ResponseBody
    public JSONObject getAllOrder(){
        List<GoodOrder> allOrder = goodOrderService.getAllOrder();

        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(allOrder));
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject curr = jsonArray.getJSONObject(i);
            String buyNamePerson;
            String vid = curr.getString("vid");
            if(!vid.equals("0")){
                Vip vip = vipService.vipLogin(vid);
                buyNamePerson = vip.getVname();
            }else{
                buyNamePerson = "游客";
            }
            String created_time = curr.getString("created_time");

            curr.put("created_time", created_time);

            curr.put("username",buyNamePerson );
            curr.put("goodName",allOrder.get(i).getGood().getName() );
            int order_status = curr.getIntValue("order_status");
            if(order_status == 0 ){
                curr.put("order_status","未付款" );
            }else  if(order_status == 1){
                curr.put("order_status","已支付" );
            }else  if(order_status == -1 ){
                curr.put("order_status","订单取消" );
            }
            String commodity_specification = curr.getString("commodity_specification");
            String[] split = commodity_specification.split("#");
            curr.put("cupType",cupTypeChinese(split[0]) );
            curr.put("goodNess",goodNessChinese(split[1]) );
        }
       JSONObject obj = new JSONObject();
        obj.put("data",jsonArray);
        obj.put("code",0);
        return obj;
    }

    @GetMapping("getOrderStatus/{bid}")
    @ResponseBody
    public JSONObject getOrderStatus(@PathVariable("bid") int bid){
        GoodOrder goodOrder = goodOrderService.selectOrderById(bid);
        JSONObject res = new JSONObject();
        if(goodOrder == null){
            // 订单被删除
            res.put("status",-2);
            res.put("msg","订单被删除");
            return res;
        }
        int order_status = goodOrder.getOrder_status();

        res.put("status",order_status);
        res.put("msg","未付款");
        if(order_status == 1){

            res.put("takeGoodIndex",++takeGoodIndex);
        }
        return res;
    }
    @GetMapping("/handleOrder/{bid}")
    @ResponseBody
    public JSONObject handOrder(@PathVariable("bid")  int bid){
        AtomicBoolean flag = new AtomicBoolean(true);
        for (ArrayList<Integer> e : shoppringCar) {
            if(e.contains(bid)){
                e.forEach(index->{
                    goodOrderService.updateOrder(index, 1);
                    flag.set(false);
                });
            }
        }
        if(flag.get()){
            goodOrderService.updateOrder(bid, 1);
        }
        GoodOrder goodOrder = goodOrderService.selectOrderById(bid);
        JSONObject jsonObject = new JSONObject();
        if(goodOrder.getOrder_status() != 1){
            jsonObject.put("status","error");
            jsonObject.put("msg","审核失败");

        }else{
            jsonObject.put("status","success");
            jsonObject.put("msg","审核成功");
        }
        return jsonObject;

    }
    public String goodNessChinese(String goodNess){
        switch (goodNess){
            case "littleSweet":
                return "少糖";
            case "middleSweet":
                return "中糖";
            case "manySweet":
                return "多糖";

        }
        return null;
    }
    public String cupTypeChinese(String cupType){
        switch (cupType){
            case "middleCup":
                return "中杯";
            case "bigCup":
                return "大杯";
            case "bigPlusCup":
                return "超大杯";

        }
        return null;
    }

    @PostMapping("/getDateSelectOrder")
    @ResponseBody
    public String getDateSelectOrder(@RequestBody JSONObject jsonObject){
        ArrayList<String> array = (ArrayList)jsonObject.get("param");
        String begintTime = array.get(0);
        String endTime =  array.get(1);
        List<String> daysStr = IGoodOrderService.findDaysStr(begintTime, endTime);
        List<String > data1 = new ArrayList<>();
        List<Double > data2 = new ArrayList<>();
        daysStr.forEach(e->{
            data1.add(e);
            String str = goodOrderService.getDateSelectOrder(e);
            double money;
            if(str == null){
                money = 0;
            }else{
                money = Double.valueOf(str) ;
            }
            data2.add(money);
            //System.out.println(e);
//            List<GoodOrder> dateSelectOrder = goodOrderService.getDateSelectOrder(e);
//            dateSelectOrder.forEach(item->{
//                System.out.println(item.toString());
//            });
        });
        JSONObject obj = new JSONObject();
        obj.put("data1",data1);
        obj.put("data2",data2);
        return obj.toJSONString();
    }
    @GetMapping("/test")
    @ResponseBody
    public void test(String[] args) {
        String begin = "2019-01-01 12:00:24";
        String end = "2020-03-02 12:00:24";
        List<String> daysStr = IGoodOrderService.findDaysStr(begin, end);
        daysStr.forEach(e->{
           // System.out.println();
            Goods good = new Goods();
            good.setId(42);

            GoodOrder goodOrder = new GoodOrder(0,"123456",1,50.0, Double.valueOf(RandomStringUtils.randomNumeric(5)),
                    e +" 12:00:00",good,"middleCup#littleSweet",1);
            goodOrderService.addOrder(goodOrder);
        });

    }
}
