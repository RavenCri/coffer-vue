package Management.CoffeeShop.mapper;



import java.util.Date;

import Management.CoffeeShop.entity.GoodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GoodOrderMapperTest {
	
	/**
	 * 自动装载接口
	 */
	@Autowired 
	private GoodOrderMapper orderMapper;
	
	/**
	 * 插入商品数据测试
	 */
	//@Test
//    public void insert() {
//        GoodOrder goodOrder = new GoodOrder();
//        goodOrder.setVid(1);
//        goodOrder.setNum(3);
//        goodOrder.setMoney(3);
//        goodOrder.setFmoney(4);
//        goodOrder.setCreatedTime(new Date());
//        System.out.println(goodOrder);
//        Integer rows = orderMapper.insert(goodOrder);
//        System.err.println("rows=" + rows);
//    }

}
