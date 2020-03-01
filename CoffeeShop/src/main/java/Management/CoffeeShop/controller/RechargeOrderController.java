package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.RechargeOrder;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.service.ex.RechargeOrderServiceImpl;
import Management.CoffeeShop.service.impl.VipServiceImpl;
import Management.CoffeeShop.websocket.WebSocketServer;
import cn.hutool.core.date.DateUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/recharge")
public class RechargeOrderController {
    @Autowired
    RechargeOrderServiceImpl rechargeOrderService;
    @Autowired
    VipServiceImpl vipService;
    @RequestMapping("/addMoney")
    private JSONObject addmoney(@RequestBody JSONObject jsonObject){
        JSONObject param = jsonObject.getJSONObject("param");
        double money = param.getDouble("money");
        String vipId = param.getString("vipId");
        System.out.println("充值会员卡："+vipId);
        Vip vip = vipService.vipLogin(vipId);
        JSONObject res = new JSONObject();
        if( vip !=null){
            RechargeOrder rechargeOrder = new RechargeOrder();
            rechargeOrder.setOrder_status(0);
            rechargeOrder.setRecharge_money(money);
            rechargeOrder.setVid(vip.getVip_id());
            rechargeOrder.setTime( DateUtil.now());
            rechargeOrderService.addRechargeOrder(rechargeOrder);
            res.put("orderId",rechargeOrder.getId());
            res.put("status","success");
            res.put("msg","已提交订单");
            res.put("customer",vip.getVname());
            res.put("vipId",vip.getVip_id());
            res.put("rechargeMoney",money);
            JSONObject noticeMsg = new JSONObject();
            noticeMsg.put("msgType","rechargeOrder");

            noticeMsg.put("data",res.toJSONString());
            WebSocketServer.sendInfo(noticeMsg.toJSONString());
        }else{
            res.put("status","error");
            res.put("msg","会员ID不存在");
        }
        return  res;
    }
    @PostMapping("cancelOrder")
    @ResponseBody
    public JSONObject cancelOrder(@RequestBody JSONObject jsonObject){
        JSONObject res = new JSONObject();
        try{
            JSONObject param = jsonObject.getJSONObject("param");
            int id = param.getInteger("id");
            RechargeOrder rechargeOrder = rechargeOrderService.getRechargrOrderById(id);
            rechargeOrder.setOrder_status(-1);
            rechargeOrderService.updateRechargeOrderStatus(rechargeOrder);

            JSONObject noticeMsg = new JSONObject();

            noticeMsg.put("msgType","cancelOrder");
            WebSocketServer.sendInfo(noticeMsg.toJSONString());
            return res.fluentPut("status","success");
        }catch (Exception e){
            res.fluentPut("msg",e.getMessage());
            return res.fluentPut("status","success");
        }

    }
    @RequestMapping("/handleOrder")
    private JSONObject handleRechargeOrder(int id){
        RechargeOrder rechargeOrder = rechargeOrderService.getRechargrOrderById(id);
        JSONObject res = new JSONObject();
        if(rechargeOrder != null ){
            Vip vip = vipService.vipLogin(rechargeOrder.getVid() + "");

            double addMoney = rechargeOrder.getRecharge_money();
            if(rechargeOrder.getRecharge_money() >= 100 && rechargeOrder.getRecharge_money() <=500){
                addMoney = (rechargeOrder.getRecharge_money()%100)*10;

            }else if(rechargeOrder.getRecharge_money() > 500 && rechargeOrder.getRecharge_money() <1000){
                addMoney = 50+((rechargeOrder.getRecharge_money()-500)%100)*20;
            }else if(rechargeOrder.getRecharge_money() >= 1000){
                addMoney = (rechargeOrder.getRecharge_money()%1000)*30;
            }
            int redit = vip.getCredit()+(int)addMoney;
            //增加多少钱 送多少积分
            vip.setCredit(redit);
            vipService.updateVipInfo(vip);
            vipService.updateMoney(vip.getVmoney()+addMoney,vip);
            rechargeOrder.setOrder_status(1);
            rechargeOrderService.updateRechargeOrderStatus(rechargeOrder);
            res.put("status","success");
            res.put("msg","充值成功");
        }else{
            res.put("status","error");
            res.put("msg","订单不存在");
        }
        return  res;
    }
    @RequestMapping("/selectRechargeStatus")
    private JSONObject orderStatusById(int id){
        RechargeOrder rechargeOrder = rechargeOrderService.getRechargrOrderById(id);
        //System.out.println(rechargeOrder);
        JSONObject res = new JSONObject();
        if( rechargeOrder !=null){
            if(rechargeOrder.getOrder_status() == 1){
                Vip vip = vipService.vipLogin(rechargeOrder.getVid());
                res.put("status",rechargeOrder.getOrder_status());
                res.put("msg","充值成功");
                res.put("balance",vip.getVmoney());
            }else{
                res.put("status",0);
                res.put("msg","未付款");
            }

        }else{
            res.put("status",-1);
            res.put("msg","该订单不存在");
        }
        return res;
    }
    @RequestMapping("/getAllOrder")
    private JSONObject getAllRechargeOrder(){

        List<RechargeOrder> allOrder = rechargeOrderService.getAllOrder();
        allOrder.forEach(e->{
            System.out.println("--->"+e);
        });
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(allOrder));
        for (int i = 0; i < jsonArray.size(); i++) {
            System.out.println(jsonArray.toJSONString());
            JSONObject curr = jsonArray.getJSONObject(i);
            Vip vip = vipService.vipLogin(allOrder.get(i).getVid());
            curr.put("vipName",vip.getVname());


            curr.put("time",allOrder.get(i).getTime());
        }
        JSONObject obj = new JSONObject();
        obj.put("data",jsonArray);
        obj.put("code",0);
        return obj;
    }
}
