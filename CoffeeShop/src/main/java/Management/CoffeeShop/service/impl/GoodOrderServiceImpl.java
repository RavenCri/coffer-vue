package Management.CoffeeShop.service.impl;

import Management.CoffeeShop.entity.GoodOrder;
import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.mapper.GoodOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Management.CoffeeShop.service.IGoodOrderService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 实现订单业务
 * @author nbtarena
 *
 */
@Service //spring启动会创建该对象
public class GoodOrderServiceImpl implements IGoodOrderService {
	@Autowired
	GoodOrderMapper orderMapper;

	/**
	 * 订单添加商品
	 */


	@Override
	public void addOrder(GoodOrder goodOrder) {
		orderMapper.addOrder(goodOrder);
	}

	@Override
	public GoodOrder selectOrderById(int id) {
		return orderMapper.selectOrderById(id);
	}

	@Override
	public List<GoodOrder> selectOrderByVipId(String vipId) {
		return orderMapper.selectOrderByVipId(vipId);
	}

	@Override
	public void updateOrder(Integer bid, Integer status) {
		orderMapper.updateOrder(bid, status);
	}

	@Override
	public List<GoodOrder> getAllOrder() {
		List<GoodOrder> allOrder = orderMapper.getAllOrder();
		return allOrder;
	}

	@Override//List<GoodOrder>
	public  String getDateSelectOrder(String dateTime) {
		return orderMapper.getDateSelectOrder(dateTime);
	}


}
