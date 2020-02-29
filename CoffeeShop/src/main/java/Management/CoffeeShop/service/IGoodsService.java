package Management.CoffeeShop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import Management.CoffeeShop.entity.Goods;

/**
 * 处理商品相关业务的接口
 * @author nbtarena
 *
 */
public interface IGoodsService {
	
	/**
	 * 商品登记
	 * @param goods 新商品的信息
	 */
	void reg(Goods goods);

	List<Goods> findGoodsByType(int type);
	/**
	 * 查询所有商品资料
	 * @return 返回商品资料
	 */
	List<Goods> findAllInfo();

	/**
	 * 查询最新添加的商品
	 * @return 返回商品资料
	 */
	List<Goods> findNewGoods();
	
	/**
	 * 根据商品编号或者名称查询商品资料
	 * @return 返回商品资料
	 */
	Goods findInfoByNameOrNumber(String name,Integer number);
	
	/**
	 * 根据商品编号查询商品资料
	 * @return 返回商品资料
	 */
	Goods findInfoByNumber(Integer number);
	
	/**
	 * 删除商品
	 * @param number
	 */
	void delete(Integer number);
	
	/**
	 * 修改商品信息
	 */
	void changeInfo(Goods goods);
	
	
	
}
