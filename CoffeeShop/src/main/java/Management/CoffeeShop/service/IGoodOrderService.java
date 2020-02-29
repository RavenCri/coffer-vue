package Management.CoffeeShop.service;

import Management.CoffeeShop.entity.GoodOrder;

import java.util.List;

/**
 * 处理商品相关业务的接口
 * @author nbtarena
 *
 */
public interface IGoodOrderService {
	
	/**
	 * 商品添加
	 * @param goods 新商品的信息
	 */

	public void addOrder(GoodOrder goodOrder);

	public GoodOrder selectOrderById(int  id);

	public List<GoodOrder> selectOrderByVipId(int  vipId);

	void cancelOrder(Integer i);
}
