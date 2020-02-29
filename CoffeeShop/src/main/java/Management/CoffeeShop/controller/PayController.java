package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.GoodOrder;
import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.mapper.GoodOrderMapper;
import Management.CoffeeShop.mapper.GoodsMapper;
import Management.CoffeeShop.service.IGoodOrderService;
import Management.CoffeeShop.service.IGoodsService;
import Management.CoffeeShop.service.IVipService;
import Management.CoffeeShop.util.JsonResult;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("order")
public class PayController {

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
        String create_time = System.currentTimeMillis()+"";
        String commodity_specification = param.getString("cupType")+"#"+param.getString("sweetNess");
        // 会员id
        String vipId = param.getString("vipId")==null?"0":param.getString("vipId");
        double fmoney = money ;
        System.out.println("vipId"+vipId);
        String order_describe = "";
        // 如果登陆了
        if(!vipId.equals("0")){
            Vip vip = vipService.vipLogin(vipId);
            // 防止前端伪造数据
            if(vip !=null){
                fmoney=Double.valueOf(df.format(money*0.95));
                if(vip.getVmoney() < fmoney){
                    res.put("status","error");
                    res.put("msg","余额不足");
                    return res;
                }
                order_describe = "1";

                res.put("takeGoodIndex",++takeGoodIndex);
                vip.setVmoney(vip.getVmoney()-fmoney);
                vipService.updateMoney(vip.getVmoney(),vip);
            }
        }else{
            order_describe = "0";
        }

        GoodOrder goodOrder = new GoodOrder(0,vipId,buyNum,money,fmoney,create_time,good,commodity_specification,order_describe);
        goodOrderService.addOrder(goodOrder);

        result.add(goodOrder.getBid());
        res.put("result",result);

        res.put("status","success");
        res.put("msg","订单已提交");
        return res;
    }
    @RequestMapping("/selectOrderByVipId")
    @ResponseBody
    public JSONArray selectOrderByVipId(@RequestBody JSONObject json){
        String id = json.getString("id");
        List<GoodOrder> goodOrders = goodOrderService.selectOrderByVipId(1);
        return JSONArray.parseArray(JSON.toJSONString(goodOrders));
    }

    @RequestMapping("/selectOrderById")
    @ResponseBody
    public String selectOrderById(@RequestBody JSONObject json){
        String id = json.getString("id");
        GoodOrder goodOrder = goodOrderService.selectOrderById(1);
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

            checkMoneyNum += Double.valueOf(df.format(Double.valueOf(price.getString(cupType))*buyNum));
        }
        if(vipLoginStatus){
            if(vip.getVmoney()<checkMoneyNum){
                res.put("status","error");
                res.put("msg","余额不足");
                return res;
            }
        }
        for (int i = 0; i < param.size(); i++) {
            JSONObject curr = param.getJSONObject(i);
            JSONObject price = curr.getJSONObject("price");
            Goods good = goodsService.findGoodByName(curr.getString("name"));
            int buyNum = curr.getInteger("buyNum");
            String cupType = curr.getString("cupType");

            double money  = Double.valueOf(df.format(Double.valueOf(price.getString(cupType))*buyNum));
            String create_time = System.currentTimeMillis()+"";
            String commodity_specification = curr.getString("cupType")+"#"+curr.getString("sweetNess");
            double fmoney = money;
            String order_describe = "";
            // 如果登陆了
            if(vipLoginStatus) {
                fmoney=Double.valueOf(df.format(money*0.95));

                vip.setVmoney(vip.getVmoney()-fmoney);
                vipService.updateMoney(vip.getVmoney(),vip);
                order_describe = "1";
            }else{
                order_describe = "0";
            }
            GoodOrder goodOrder = new GoodOrder(0,vipId,buyNum,money,fmoney,create_time,good,commodity_specification,order_describe);
            goodOrderService.addOrder(goodOrder);
            result.add(goodOrder.getBid());
        }
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

                goodOrderService.cancelOrder(-1);
            });
            return res.fluentPut("status","success");
        }catch (Exception e){
            res.fluentPut("msg",e.getMessage());
            return res.fluentPut("status","success");
        }

    }
}
