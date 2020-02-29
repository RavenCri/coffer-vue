package Management.CoffeeShop.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import Management.CoffeeShop.entity.User;
import Management.CoffeeShop.service.ex.ServiceException;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UserServiceTests {

	@Autowired 
	private IUserService userService;
	
	/**
	 * 注册测试
	 */
	@Test
	public void reg(){
		try {
			User user = new User();
			user.setUname("小狗");
			user.setPwd("123");
			userService.reg(user);
			System.err.println("注册成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass());
		}
	}
	
	
	/**
	 * 登陆测试
	 */
	@Test
	public void login(){
		try {
			String uname = "小狗";
			String pwd = "123";
			User user = userService.login(uname, pwd);
			System.err.println(user);
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 修改密码
	 */
	@Test
	public void updatePwdByUid(){
		try {
			Integer uid = 9;
			String oldPwd = "123";
			String newPwd = "456";
			userService.changePwd(uid, oldPwd, newPwd);
			System.err.println("修改密码成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 获取用户资料
	 */
	@Test
	public void getInfo(){
		try {
			Integer uid = 9;
			User result = userService.getInfo(uid);
			System.err.println("获取用户资料成功!");
			System.err.println(result);
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
}
