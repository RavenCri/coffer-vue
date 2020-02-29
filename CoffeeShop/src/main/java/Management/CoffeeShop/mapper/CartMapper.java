package Management.CoffeeShop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import Management.CoffeeShop.entity.Cart;
import Management.CoffeeShop.entity.CartVO;
import Management.CoffeeShop.entity.Goods;

/**
 * 购物车的持久层接口
 * @author nbtarena
 *
 */
public interface CartMapper {

	/**
	 * 添加商品数据
	 * @param goods 商品数据
	 * @return 受影响的行数
	 */
	Integer insert(Cart cart);

	/**
	 * 更新数量
	 * @param cid
	 * @param num
	 * @return
	 */
	Integer updateNumByGid(
			@Param("gid") Integer gid, 
			@Param("num") Integer num);

	/**
	 * 查找商品信息
	 * @param vid
	 * @param gid
	 * @return
	 */
	Cart findByGid(Integer gid);
	
	/**
	 * 查会员购买列表
	 * @param vid
	 * @return
	 */
	List<Cart> findByUid(Integer uid);

	/**
	 * 通过id来查找购物车数据
	 * @param id
	 * @return
	 */
	Cart findById(Integer id);
	
	/**
	 * 根据订单的商品编号删除商品信息
	 * @param gid
	 * @return
	 */
	Integer deleteByGid(Integer gid);

}
