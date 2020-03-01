package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.RechargeOrder;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.service.ex.RechargeOrderServiceImpl;
import Management.CoffeeShop.service.impl.VipServiceImpl;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/recharge")
public class RechargeOrderController {
    @Autowired
    RechargeOrderServiceImpl rechargeOrderService;
    @Autowired
    VipServiceImpl vipService;
    @RequestMapping("/addMoney")

    private JSONObject addmoney(double money, String vid){
        Vip vip = vipService.vipLogin(vid);
        JSONObject res = new JSONObject();
        if( vip !=null){
            RechargeOrder rechargeOrder = new RechargeOrder();

            rechargeOrder.setOrder_status(0);
            rechargeOrder.setRecharge_money(money);
            rechargeOrder.setVid(vip.getVid());
            res.put("status",200);
            res.put("msg","充值成功");
            rechargeOrderService.addRechargeOrder(rechargeOrder);
        }else{
            res.put("status",-1);
            res.put("msg","会员ID不存在");
        }
        return  res;
    }
    private JSONObject orderStatusById(int id){

    }
}
