package Management.CoffeeShop.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import Management.CoffeeShop.entity.User;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserMapperTests {
	
	/**
	 * 自动装载接口
	 */
	@Autowired 
	private UserMapper userMapper;
	
	/**
	 * 插入用户数据测试
	 */
	@Test
	public void insert(){
		User user = new User();
		user.setUname("小王");
		user.setPwd("123456");
		Integer rows = userMapper.insert(user);
		System.err.println("插入数据:"+rows+"行");
	}
	
	/**
	 * 根据用户id更新密码
	 */
	@Test
	public void updatePwdByUid(){
		Integer uid = 14;
		String pwd = "123456";
		Date now =new Date();
		System.err.println(now);
		Integer rows = userMapper.updatePwdByUid(uid, pwd, now);
		System.err.println("通过id更新数据:"+rows+"条");
	}
	
	/**
	 * 通过用户名查询用户数据
	 */
	@Test
	public void findByUid(){
		Integer uid = 3;
		User result = userMapper.findByUid(uid);
		System.err.println("通过id得到的用户数据:"+result);
	}
	
	/**
	 * 通过用户名查询用户数据
	 */
	@Test
	public void findByUname(){
		String uname = "小王";
		User result = userMapper.findByUname(uname);
		System.err.println("通过名称得到的用户数据:"+result);
	}
	
}
