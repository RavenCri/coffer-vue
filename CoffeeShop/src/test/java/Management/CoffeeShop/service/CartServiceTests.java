package Management.CoffeeShop.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import Management.CoffeeShop.entity.Cart;
import Management.CoffeeShop.entity.CartVO;
import Management.CoffeeShop.service.ex.ServiceException;

/**
 * 实现商品各业务功能
 * @author nbtarena
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class CartServiceTests {

	@Autowired 
	private ICartService cartService;
	
	@Test
    public void addToCart() {
        try {
            Integer gid = 2;
            Integer uid = 1;
            Integer amount = 3;
            cartService.addToCart(gid, amount,uid);
            System.err.println("OK.");
        } catch (ServiceException e) {
            System.err.println(e.getClass().getSimpleName());
            System.err.println(e.getMessage());
        }
    }
	
	
	@Test
	public void addNum() {
	    try {
	        Integer id = 781;
	        Integer newNum = cartService.addNum(id);
	        System.err.println("OK. newNum=" + newNum);
	    } catch (ServiceException e) {
	        System.err.println(e.getClass().getSimpleName());
	        System.err.println(e.getMessage());
	    }
	}
	
	@Test
    public void findByUid() {
        Integer uid = 1;
        List<Cart> result = cartService.findByUid(uid);
        System.err.println(result);
    }
	
	/**
	 * 删除订单测试
	 */
	@Test
	public void deleteGoods(){
		try {
			Integer gid = 101;
			cartService.deleteOne(gid);
			System.err.println("删除商品成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
}
