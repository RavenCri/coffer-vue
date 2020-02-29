package Management.CoffeeShop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Management.CoffeeShop.entity.User;
import Management.CoffeeShop.service.IUserService;
import Management.CoffeeShop.util.JsonResult;

/**
 * 用户控制器类
 * @author nbtarena
 *
 */
@RestController
@RequestMapping("user")
public class UserController extends BaseController{

	@Autowired
	private IUserService service;

	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping("reg")
	public JsonResult<Void> reg(User user){
		//调用userService的reg()方法实现注册
		System.err.println("1");
		System.err.println("2");
		service.reg(user);
		System.err.println("3");
		//返回状态码OK
		return new JsonResult<Void>(OK);
	}
	
	/**
	 * 登陆
	 * @param uname
	 * @param pwd
	 * @param session
	 * @return
	 */
	@RequestMapping("login")
	@ResponseBody
	public JsonResult<User> login(String uname,String pwd,HttpSession session){
		//调用userService的login()方法实现注册
		System.err.println("1");
		User user = service.login(uname, pwd);
		//将uid和uname放入session中
		session.setAttribute("uid",user.getUid());
		//session.setAttribute("uname",user.getUname());
		System.err.println("2");
		return new JsonResult<>(OK,user);
	}
	
	/**
	 * 先进行登陆,修改密码
	 * @param oldPwd 旧密码
	 * @param newPwd 新密码
	 * @param session 存储登陆用户的id
	 * @return 返回给客户端状态码
	 */
	@RequestMapping("pwdChange")
	@ResponseBody
	public JsonResult<Void> changePwd(String oldPwd,String newPwd,HttpSession session){
		//从session中获取uid和uname
		System.err.println("1");
		Integer uid = Integer.valueOf(session.getAttribute("uid").toString());
		//String uname = session.getAttribute("uname").toString();
		//调用userService的changePwd()方法实现修改密码
		service.changePwd(uid, oldPwd, newPwd);
		System.err.println("3");
		return new JsonResult<Void>(OK);
	}
	
	/**
	 * 获取用户信息
	 * @param session 存储uid
	 * @return 返回用户信息
	 */
	@GetMapping("info")
	public JsonResult<User> getInfo(HttpSession session){
		//获取登陆后的session保存的uid值
		System.err.println("3");
		Integer uid = Integer.valueOf(session.getAttribute("uid").toString());
		//调用userService的getInfo方法实现功能
		User user = service.getInfo(uid);
		System.err.println("4");
		//返回状态码和相应数据
		return new JsonResult<>(OK,user);
	}
	
}
