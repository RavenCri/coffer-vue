package Management.CoffeeShop.service;

import Management.CoffeeShop.entity.User;

/**
 * 处理用户相关业务的接口
 * @author nbtarena
 *
 */
public interface IUserService {
	
	/**
	 * 用户注册
	 * @param user 新用户的信息
	 */
	void reg(User user);
	
	/**
	 * 用户登陆
	 * @param uname 用户名
	 * @param pwd 密码
	 * @return 用户信息
	 */
	User login(String uname,String pwd);
	
	/**
	 * 修改密码
	 * @param uid 用户id
	 * @param oldPwd 旧密码
	 * @param newPwd 新密码
	 */
	void changePwd(Integer uid,String oldPwd,String newPwd);
	
	/**
	 * 查询用户资料
	 * @param uid 用户id
	 * @return 返回用户资料
	 */
	User getInfo(Integer uid);
}
