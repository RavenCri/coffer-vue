package Management.CoffeeShop.controller;

import Management.CoffeeShop.entity.Column_goods;
import Management.CoffeeShop.service.IColumn_GoodsService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class PageContoller {
    @Autowired
    IColumn_GoodsService iColumn_goodsService;
    @RequestMapping("/good_add")
    public String goGoodAdd(Model model){
        List<Column_goods> column_goods = iColumn_goodsService.getColumn_goods();
//        column_goods.forEach(e->{
//            System.out.println(e);
//        });
        model.addAttribute("goods",column_goods);
        JSONArray array= JSONArray.parseArray(JSON.toJSONString(column_goods));
        System.out.println(array.toJSONString());
        model.addAttribute("data", array.toJSONString());
        return "goodAdd";
    }
    @RequestMapping("/orderManager")
    public String goOrderManager(){

        return "orderManager";
    }
}
