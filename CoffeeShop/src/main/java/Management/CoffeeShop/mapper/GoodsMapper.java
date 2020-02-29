package Management.CoffeeShop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import Management.CoffeeShop.entity.Goods;

/**
 * 处理商品增删改查的持久层接口
 * @author nbtarena
 *
 */
public interface GoodsMapper {
	/**
	 * 插入商品数据
	 * @param goods 商品数据
	 * @return 受影响的行数
	 */
	Integer insert(Goods goods);
	
	/**
	 * 通过商品编号查找商品信息
	 * @param number
	 * @return
	 */
	Goods findByNumber(Integer number);

	/**
	 * 通过商品名称查找商品信息
	 * @param name
	 * @return
	 */
	Goods findByName(String name);
	
	/**
	 * 通过商品名称或者编号查找商品信息
	 * @param name
	 * @return
	 */
	Goods findByNameOrNumber(@Param("name")String name,@Param("number")Integer number);
	
	/**
	 * 查找所有商品信息
	 * @param name
	 * @return
	 */
	List<Goods> findAll();
	
	/**
	 * 根据商品编号删除商品信息
	 * @param number
	 * @return
	 */
	Integer deleteByNumber(Integer number);
	
	/**
	 * 通过商品编号更新商品信息
	 * @param number
	 * @return
	 */
	Integer updateByNumber(Goods goods);

    List<Goods> findNewGoods();

	List<Goods> findGoodsByType(int type);
}
