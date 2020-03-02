package Management.CoffeeShop.service;

import Management.CoffeeShop.entity.GoodOrder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

	public List<GoodOrder> selectOrderByVipId(String  vipId);

	void updateOrder(Integer bid,Integer status);

	List<GoodOrder> getAllOrder();

	static List<String> findDaysStr(String begintTime, String endTime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date dBegin = null;
		Date dEnd = null;
		try {
			dBegin = sdf.parse(begintTime);
			dEnd = sdf.parse(endTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		List<String> daysStrList = new ArrayList<String>();
		daysStrList.add(sdf.format(dBegin));
		Calendar calBegin = Calendar.getInstance();
		calBegin.setTime(dBegin);
		Calendar calEnd = Calendar.getInstance();
		calEnd.setTime(dEnd);
		while (dEnd.after(calBegin.getTime())) {
			calBegin.add(Calendar.DAY_OF_MONTH, 1);
			String dayStr = sdf.format(calBegin.getTime());
			daysStrList.add(dayStr);
		}
		return daysStrList;
	}

}
