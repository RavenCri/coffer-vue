package Management.CoffeeShop.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import Management.CoffeeShop.entity.Cart;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CartMapperTests {
	
	/**
	 * 自动装载接口
	 */
	@Autowired 
	private CartMapper cartMapper;
	
	/**
	 * 插入商品数据测试
	 */
	@Test
    public void insert() {
        Cart cart = new Cart();
        cart.setVid(1);
        cart.setGid(2);
        cart.setNum(3);
        cart.setPrice(50);
        Integer rows = cartMapper.insert(cart);
        System.err.println("rows=" + rows);
    }

	/**
	 * 更新数量
	 */
    @Test
    public void updateNumById() {
        Integer id = 1;
        Integer num = 10;
        Integer rows = cartMapper.updateNumByGid(id, num);
        System.err.println("rows=" + rows);
    }

    /**
     * 查询订单
     */
    @Test
    public void findByVidAndGid() {
        Integer gid = 2;
        Cart result = cartMapper.findByGid(gid);
        System.err.println(result);
    }
    
	
    @Test
    public void findByid() {
        Integer id = 781;
        Cart result = cartMapper.findById(id);
        System.err.println(result);
    }
    
    @Test
    public void findByUid() {
        Integer uid = 1;
        List<Cart> result = cartMapper.findByUid(uid);
        System.err.println(result);
    }
    
    /**
	 * 删除
	 */
	@Test
	public void deleteByGid(){
		Integer gid = 102;
		Integer rows = cartMapper.deleteByGid(gid);
		System.err.println("删除的个数:"+rows);
	}
}
