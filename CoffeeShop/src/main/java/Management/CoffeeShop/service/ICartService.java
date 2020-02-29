package Management.CoffeeShop.service;

import java.util.List;

import Management.CoffeeShop.entity.Cart;
import Management.CoffeeShop.entity.CartVO;

/**
 * 购物车相关业务的接口
 * @author nbtarena
 *
 */
public interface ICartService {
	
	/**
	 * 商品添加进订单表
	 * @param goods 新商品的信息
	 */
	void addToCart(Integer gid, Integer amount,Integer uid);
	
	
	/**
	 * 通过商品编号查找商品信息显示出来
	 * @param vid
	 * @param gid
	 * @return
	 */
	Cart findByGid(Integer gid);
	
	/**
	 * 增加数量
	 * @param username
	 * @return
	 */
	Integer addNum(Integer gid);
	
	/**
	 * 减少数量
	 * @param username
	 * @return
	 */
	Integer delNum(Integer gid);

	/**
	 * 订单编号查购物车
	 * @param uid
	 * @return
	 */
	List<Cart> findByUid(Integer uid);
	
	/**
	 * 删除一行订单数据
	 * @param number
	 */
	void deleteOne(Integer gid);
}
