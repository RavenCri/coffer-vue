package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.GoodOrder;
import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.mapper.GoodOrderMapper;
import Management.CoffeeShop.mapper.GoodsMapper;
import Management.CoffeeShop.service.IVipService;
import Management.CoffeeShop.util.JsonResult;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.DecimalFormat;
import java.util.List;

@Controller
@RequestMapping("order")
public class PayController {
    @Autowired
    GoodOrderMapper goodOrderMapper;
    @Autowired
    GoodsMapper goodsMapper;
    @Autowired
    IVipService vipService;
    @PostMapping("addPay")
    @ResponseBody
    public String addPay(@RequestBody JSONObject jsonObject){
        //System.out.println(jsonObject);
       // System.out.println(jsonObject.getJSONObject("param").getJSONObject("price"));
        JSONObject param = jsonObject.getJSONObject("param");
        JSONObject price = param.getJSONObject("price");
        Goods good = goodsMapper.findByName(param.getString("name"));
        int buyNum = param.getInteger("buyNum");
        String cupType = param.getString("cupType");
        DecimalFormat    df   = new DecimalFormat("######0.00");
        double money  = Double.valueOf(df.format(Double.valueOf(price.getString(cupType))*buyNum));
        String create_time = System.currentTimeMillis()+"";
        String commodity_specification = param.getString("cupType")+"#"+param.getString("sweetNess");
        // 会员id
        String vipId = param.getString("vipId")==null?"0":param.getString("vipId");
        double fmoney ;
        System.out.println("vipId"+vipId);
        // 如果登陆了
        if(!vipId.equals("0")){
            Vip vip = vipService.vipLogin(vipId);

            // 防止前端伪造数据
            if(vip !=null){
                fmoney=Double.valueOf(df.format(money*0.95));
                vip.setVmoney(vip.getVmoney()-fmoney);

                vipService.updateMoney(vip.getVmoney(),vip);
            }else{
                fmoney = money;
            }
        }else{
            fmoney = money;
        }



        GoodOrder goodOrder = new GoodOrder(0,vipId,buyNum,money,fmoney,create_time,good,commodity_specification);

        goodOrderMapper.addOrder(goodOrder);





        return "ok";
    }
    @RequestMapping("/selectOrderByVipId")
    @ResponseBody
    public JSONArray selectOrderByVipId(@RequestBody JSONObject json){
        String id = json.getString("id");
        List<GoodOrder> goodOrders = goodOrderMapper.selectOrderByVipId(1);
        return JSONArray.parseArray(JSON.toJSONString(goodOrders));
    }

    @RequestMapping("/selectOrderById")
    @ResponseBody
    public String selectOrderById(@RequestBody JSONObject json){
        String id = json.getString("id");
        GoodOrder goodOrder = goodOrderMapper.selectOrderById(1);
        return JSON.toJSONString(goodOrder);

    }
}
