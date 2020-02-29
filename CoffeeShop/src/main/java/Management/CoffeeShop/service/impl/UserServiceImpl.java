package Management.CoffeeShop.service.impl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import Management.CoffeeShop.entity.User;
import Management.CoffeeShop.mapper.UserMapper;
import Management.CoffeeShop.service.IUserService;
import Management.CoffeeShop.service.ex.InsertException;
import Management.CoffeeShop.service.ex.PwdLengthException;
import Management.CoffeeShop.service.ex.PwdNotMatchException;
import Management.CoffeeShop.service.ex.UnameDuplicateException;
import Management.CoffeeShop.service.ex.UpdateException;
import Management.CoffeeShop.service.ex.UserNotFoundException;

/**
 * 实现业务:用户注册
 * @author nbtarena
 *
 */
@Service //spring启动会创建该对象
public class UserServiceImpl implements IUserService{
	
	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 注册功能
	 */
	@Override
	public void reg(User user) {
		// 根据参数user对象中的username属性查询用户数据
		User result = userMapper.findByUname(user.getUname());
        // 判断查询结果是否不为null
		if(result != null){
			// 是：抛出UsernameDuplicateException对象
			throw new UnameDuplicateException();
		}
		//否:进行注册
		//对密码进行加密设置:设置盐值
		//UUID:UUID是指在一台机器上生成的数字，它保证对在同一时空中的所有机器都是唯一的。
		//用到了以太网卡地址、纳秒级时间、芯片ID码和随机数。
		//设置随机盐值
		String salt = UUID.randomUUID().toString().toUpperCase(); 
		//获取初始密码
		String pwd = user.getPwd();
		if(pwd.length()<6){
			throw new PwdLengthException("密码长度小于6");
		}
		//加密后的md5密码
		String md5Pwd = getMd5Pwd(pwd,salt);
		//设置md5密码
		user.setPwd(md5Pwd);
		user.setSalt(salt);
		// 调用userMapper的insert()方法执行注册，获取返回的受影响行数
        Integer rows = userMapper.insert(user);
        // 判断受影响的行数是否不为1
        if(rows != 1){
        	// 是：表示注册失败，则抛出InsertException对象
        	throw new InsertException();
        }
	}

	/**
	 * 登陆功能
	 */
	@Override
	public User login(String uname, String pwd) {
		// 调用userMapper的findByUsername()，根据参数username查询用户数据
		User result = userMapper.findByUname(uname);
	    // 判断查询结果是否为null
		if(result == null){
			// 是：登录失败,抛出UserNotFoundException
			throw new UserNotFoundException("用户名不存在");
		}
		// 从查询结果中取出salt值
	    String salt = result.getSalt();
	    // 调用getMd5Password(String password, String salt)方法，将参数password加密，得到md5Password
	    String md5Pwd = getMd5Pwd(pwd, salt);
	    // 判断查询结果中的password与以上加密得到的md5Password是否不同
	    if(!result.getPwd().equals(md5Pwd)){
	    	// 是：密码错误，抛出PasswordNotMatchException
	    	throw new PwdNotMatchException("密码错误");
	    }
	    User user = new User();
	    // [1] 将查询结果中除了uid,username以外的属性都设置为null
	    // [1] 返回查询结果
	    // [2] 创建新的User对象，将查询结果中的uid,username封装到新的对象中
	    user.setUid(result.getUid());
	    user.setUname(result.getUname());
	    // [2] 返回新的User对象
		return user;
	}
	
	/**
	 * 修改密码
	 */
	@Override
	public void changePwd(Integer uid, String oldPwd, String newPwd) {
		// 根据参数uid查询用户数据
		User result = userMapper.findByUid(uid);
		// 判断查询结果是否为null
		if(result == null){
			// 是：UserNotFoundException
			throw new UserNotFoundException("用户未找到");
		}
		// 从查询结果中获取salt值
		String salt = result.getSalt();
		// 将参数oldPassword结合salt加密，得到oldMd5Password
		String oldMd5Pwd = getMd5Pwd(oldPwd, salt);
		// 判断oldMd5Password与查询结果中的密码是否不同
		if(!result.getPwd().equals(oldMd5Pwd)){
			// 是：抛出PasswordNotMatchException
			throw new PwdNotMatchException("原密码错误");
		}
	    // 将参数newPassword结合salt加密，得到newMd5Password
		String newMd5Pwd = getMd5Pwd(newPwd, salt);
	    // 创建当前时间对象
		Date now = new Date();
	    // 执行修改密码，并获取受影响的行数
		Integer rows = userMapper.updatePwdByUid(uid, newMd5Pwd, now);
		System.err.println("修改密码受影响的条数:"+rows+"条");
	    // 判断受影响的行数是否不为1
		if(rows!=1){
			// 是：抛出UpdateException
			throw new UpdateException("更新密码时出现未知错误,请联系系统管理员!");
		}
	}
	
	/**
	 * 执行加密
	 * @param pwd 原密码
	 * @param salt 盐值
	 * @return 加密后的密码
	 */
	private String getMd5Pwd(String pwd, String salt) {
		//设置加密规则:将盐值拼接在密码的前后,然后加密5次
		for (int i = 0; i < 5; i++) {
			//md5码加密
			pwd = DigestUtils.md5DigestAsHex((salt+pwd+salt).getBytes()).toUpperCase();
		}
		return pwd;
	}

	/**
	 * 获取用户资料
	 */
	@Override
	public User getInfo(Integer uid) {
		// 根据参数uid查询用户数据
		User result = userMapper.findByUid(uid);
		// 判断查询结果是否为null
		if(result == null){
			// 是：UserNotFoundException
			throw new UserNotFoundException("用户数据不存在");
		}
		//创建新的user对象
		User user = new User();
		//封装数据(根据uid查询的用户数据)
		user.setUname(result.getUname());
		user.setModifiedTime(result.getModifiedTime());
		return user;
	}

	
	
}
