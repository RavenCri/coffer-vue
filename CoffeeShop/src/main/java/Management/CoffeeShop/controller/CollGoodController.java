package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.CollectGood;
import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.service.CollectGoodService;
import Management.CoffeeShop.service.IGoodsService;
import Management.CoffeeShop.service.IVipService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

@Controller
@RequestMapping("collect")
public class CollGoodController {
    @Autowired
    private IVipService service;
    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private CollectGoodService collectGoodService;
    @RequestMapping("/add")
    @ResponseBody
    private JSONObject collGoods(@RequestBody JSONObject jsonObject){
        String name = jsonObject.getString("goodName");
        String vipId = jsonObject.getString("vipId");
        Goods good = goodsService.findGoodByName(name);


        CollectGood collectGood = new CollectGood();
        collectGood.setGood_name(good.getName());
        collectGood.setVip_id(vipId);

        List<CollectGood> colls = collectGoodService.getCollectGoodByVipId(vipId);
        AtomicBoolean flag = new AtomicBoolean(true);
        colls.forEach(e->{
            if(e.getGood_name().equals(name)){
                flag.set(false);
            }
        });
        if(flag.get()){

            collectGoodService.addCollectGood(collectGood);
            return new JSONObject().fluentPut("status","success");
        }else {
            return new JSONObject().fluentPut("status","alreadyColl");
        }

    }
    @RequestMapping("/getCollGood")
    @ResponseBody
    private String getCollGood(@RequestBody JSONObject jsonObject){

        String vipId = jsonObject.getString("vipId");

        List<CollectGood> collectGoodByVipId = collectGoodService.getCollectGoodByVipId(vipId);
        List<JSONObject> result = new ArrayList<>();
        collectGoodByVipId.forEach(e->{
            Goods good = goodsService.findGoodByName(e.getGood_name());
            JSONObject json = JSONObject.parseObject(JSON.toJSONString(good));
            json.put("image_url","http://localhost/getGoodsImg?filename="+json.getString("image_url"));
            result.add(json);
        });
        JSONObject res = new JSONObject();
        res.put("result",result);
        res.put("status","success");
        //System.out.println(res.toJSONString());
        return res.toJSONString();
    }
}
