package Management.CoffeeShop.controller;

import java.util.List;

import Management.CoffeeShop.entity.Column_goods;
import Management.CoffeeShop.entity.Goods_type;
import Management.CoffeeShop.service.IColumn_GoodsService;
import Management.CoffeeShop.service.IGoods_typeService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.service.IGoodsService;
import Management.CoffeeShop.util.JsonResult;

/**
 * 商品控制器类
 * @author nbtarena
 *
 */
@RestController
@RequestMapping("goods")
public class GoodsController extends BaseController{

	@Autowired
	private IGoodsService service;
	@Autowired
	IColumn_GoodsService iColumn_goodsService;
	@Autowired
	IGoods_typeService iGoods_typeService;
	@Autowired
	IGoodsService iGoodsService;
	/**
	 * 登记商品
	 * @param goods
	 * @return
	 */
	@RequestMapping("reg")
	@ResponseBody
	public JsonResult<Void> reg(Goods goods){
		goods.setAdd_time(System.currentTimeMillis()+"");
		service.reg(goods);

		System.err.println("2");
		//返回状态码OK
		return new JsonResult<Void>(OK);
	}

	/**
	 * 获取所有商品信息
	 * @return 返回商品信息
	 */
	@RequestMapping("allInfo")
    public List<Goods> ShowAllInfo(Model model){
		List<Goods> info=service.findAllInfo();
		System.err.println(info);
        return info;
    }
	@RequestMapping("goods")
	public String getGoodsInfo(){
		JSONArray res = new JSONArray();

		List<Column_goods> column_goods = iColumn_goodsService.getColumn_goods();

		column_goods.forEach((e)->{
			JSONObject goodBigType = new JSONObject();
			goodBigType.put("type",e.getColumn_type());

			JSONArray goods = new JSONArray();
			List<Goods_type> goods_typeList = e.getGoods_typeList();

			// 果汁 咖啡
			goods_typeList.forEach(item->{
				List<Goods> goodsByType = iGoodsService.findGoodsByType(item.getId());
				JSONArray goods2 = new JSONArray();

				goodsByType.forEach(good->{
					String prices[] = good.getPrice().trim().split(" ");
					goods2.add(new JSONObject()
							.fluentPut("name",good.getName())
							.fluentPut("imageUrl","http://localhost/getGoodsImg?filename="+good.getImage_url())
							.fluentPut("price",new JSONObject().fluentPut("middleCup",prices[0])
									.fluentPut("bigCup",prices[1])
									.fluentPut("bigPlusCup",prices[2])
							));
				});
				goods.add(new JSONObject().fluentPut("smallColumn",item.getSmall_column())
											.fluentPut("goods",goods2));
			});
			goodBigType.put("goods",goods);

			res.add(goodBigType);
		});
		return  res.toJSONString();
	}
	//@RequestMapping("goods")
	public String getGoods(){
		JSONObject type_drink = new JSONObject();
		JSONObject type_coke = new JSONObject();
		JSONObject type_setMeal = new JSONObject();

		JSONArray drink = new JSONArray();
		JSONArray coke = new JSONArray();
		JSONArray setMeal = new JSONArray();

		type_drink.put("type","饮品专区");
		type_drink.put("goods",drink);
		type_coke.put("type","糕点专区");
		type_coke.put("goods",coke);
		type_setMeal.put("type","套餐专区");
		type_setMeal.put("goods",setMeal);

		JSONArray res = new JSONArray();

		List<Goods> info=service.findAllInfo();
		JSONArray temp = null;
		for(Goods good: info){
			String prices[] = good.getPrice().trim().split(" ");
			if(good.getType() == 0){
				temp = drink;
			}else if(good.getType() == 1){
				temp = coke;
			}else if(good.getType() == 2){
				temp = setMeal;
			}
			temp.add(new JSONObject()
					.fluentPut("name",good.getName())
					.fluentPut("imageUrl","http://localhost/getGoodsImg?filename="+good.getImage_url())
					.fluentPut("price",new JSONObject().fluentPut("middleCup",prices[0])
														.fluentPut("bigCup",prices[1])
														.fluentPut("bigPlusCup",prices[2])
					)
			);
		}
		res.fluentAdd(type_drink).fluentAdd(type_coke).fluentAdd(type_setMeal);
		return res.toJSONString();
	}
	@RequestMapping("newGoods")
	public JSONArray getNewGoods(){
		List<Goods> newGoods = service.findNewGoods();

		JSONArray jsonArray = new JSONArray();
		newGoods.forEach((e)->{
			JSONObject res = new JSONObject();
			res.fluentPut("name",e.getName()).fluentPut("imageUrl","http://localhost/getGoodsImg?filename="+e.getImage_url());
			jsonArray.add(res);
		});
		return  jsonArray;
	}
	/**
	 * 根据商品编号或者名称显示商品资料
	 * @return 返回商品资料
	 */
	@RequestMapping("InfoByNameOrNumber")
    public JsonResult<Goods> ShowInfoByNameOrNumber(String name,Integer number){
		Goods info=service.findInfoByNameOrNumber(name,number);
		System.err.println(info);
        return new JsonResult<Goods>(OK,info);
    }
	
	/**
	 * 删除商品
	 * @param number
	 * @return
	 */
	@RequestMapping("{number}/delete")
	@ResponseBody
	public JsonResult<Void> deleteVip(@PathVariable("number")Integer number){
		service.delete(number);
		System.err.println("删除成功!");
		//返回状态码OK
		return new JsonResult<>(OK);
	}
	
	/**
	 * 更新商品信息
	 */
	@RequestMapping("{number}/changeInfo")
    public JsonResult<Void> changeInfo(@PathVariable("number")Integer number,Goods goods){
		System.err.println(number);
		service.changeInfo(goods);
		System.err.println("更新商品信息成功!");
		return new JsonResult<>(OK);
    }

}
