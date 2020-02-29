package Management.CoffeeShop.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.mapper.GoodsMapper;
import Management.CoffeeShop.service.IGoodsService;
import Management.CoffeeShop.service.ex.DeleteException;
import Management.CoffeeShop.service.ex.GoodsDuplicateException;
import Management.CoffeeShop.service.ex.GoodsNotFoundException;
import Management.CoffeeShop.service.ex.InsertException;
import Management.CoffeeShop.service.ex.UpdateException;
import Management.CoffeeShop.service.ex.UploadException;
import Management.CoffeeShop.service.ex.VipNotFoundException;

/**
 * 实现业务
 * @author nbtarena
 *
 */
@Service //spring启动会创建该对象
public class GoodsServiceImpl implements IGoodsService{

	@Autowired
	private GoodsMapper goodsMapper;

	/**
	 * 商品登记功能
	 */
	@Override
	public void reg(Goods goods) {
		//商品编号和名称都要进行查询,防止相同
		// 根据参数goods对象中的number属性查询会员数据
		Goods result = goodsMapper.findByNumber(goods.getNumber());
		// 判断查询结果是否不为null
		if(result!=null){
			throw new GoodsDuplicateException();
		}
		// 根据参数goods对象中的name属性查询会员数据
		Goods result1 = goodsMapper.findByName(goods.getName());
		// 判断查询结果是否不为null
		if(result1!=null){
			throw new GoodsDuplicateException();
		}
		// 调用goodsMapper的insert()方法执行注册，获取返回的受影响行数
		Integer rows = goodsMapper.insert(goods);
		// 判断受影响的行数是否不为1
		if(rows != 1){
			// 是：表示注册失败，则抛出InsertException对象
			throw new InsertException();
		}
	}

	@Override
	public List<Goods> findGoodsByType(int type) {
		return goodsMapper.findGoodsByType(type);
	}

	/**
	 * 查询所有信息
	 */
	@Override
	public List<Goods> findAllInfo() {
		return goodsMapper.findAll();
	}

	@Override
	public List<Goods> findNewGoods() {
		return  goodsMapper.findNewGoods();
	}

	/**
	 * 根据商品编号或者名称查询商品资料
	 */
	@Override
	public Goods findInfoByNameOrNumber(String name,Integer number) {
		Goods info = goodsMapper.findByNameOrNumber(name,number);
		if(info==null){
			throw new GoodsNotFoundException();
		}
		return info;
	}
	public Goods findGoodByName(String GoodName){
		return goodsMapper.findByName(GoodName);
	}
	/**
	 * 根据商品编号查询商品资料
	 */
	@Override
	public Goods findInfoByNumber(Integer number) {
		Goods info = goodsMapper.findByNumber(number);
		if(info==null){
			throw new GoodsNotFoundException();
		}
		return info;
	}
	
	/**
	 * 删除商品
	 */
	@Override
	public void delete(Integer number) {
			Goods result = goodsMapper.findByNumber(number);
			//判断查询结果是否为 null
			if(result==null){
				//是:AddressNotFoundException
				throw new GoodsNotFoundException();
			}
			Integer rows = goodsMapper.deleteByNumber(number);
			if(rows!=1){
				throw new DeleteException();
			}
			System.err.println("删除商品个数:"+rows);
		}

	/**
	 * 修改商品信息
	 */
	@Override
	public void changeInfo(Goods goods) {
			Goods result = goodsMapper.findByNumber(goods.getNumber());
			// 判断查询结果是否不为null
			if(result==null){
				throw new GoodsNotFoundException();
			}
			Integer rows = goodsMapper.updateByNumber(goods);
			System.err.println("更新商品信息条数:"+rows);
			// 判断受影响的行数是否不为1
			if(rows != 1){
				throw new InsertException();
			}
		}


	}

