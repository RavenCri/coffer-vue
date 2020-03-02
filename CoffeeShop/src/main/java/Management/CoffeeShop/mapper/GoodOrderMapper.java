package Management.CoffeeShop.mapper;

import Management.CoffeeShop.entity.GoodOrder;

import java.util.List;

/**
 * 处理订单增删改查的持久层接口
 * @author nbtarena
 *
 */
public interface GoodOrderMapper {

	/**
	 * 添加订单数据
	 * @return 受影响的行数
	 */
	Integer insert(GoodOrder goodOrder);

    GoodOrder selectOrderById(int id);

	void addOrder(GoodOrder goodOrder);

	List<GoodOrder> selectOrderByVipId(String vipId);

	void updateOrder(int bid,int status);

    List<GoodOrder> getAllOrder();

	String getDateSelectOrder(String dateTime);
}
