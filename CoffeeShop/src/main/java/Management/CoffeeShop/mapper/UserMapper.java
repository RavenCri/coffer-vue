package Management.CoffeeShop.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import Management.CoffeeShop.entity.User;

/**
 * 处理用户增删改查的持久层接口
 * @author nbtarena
 *
 */
public interface UserMapper {
	/**
	 * 插入用户数据
	 * @param user 用户数据
	 * @return 受影响的行数
	 */
	Integer insert(User user);
	
	/**
	 * 根据用户id更新密码
	 * @param uid 用户id
	 * @param pwd 用户原密码
	 * @return 返回受影响的行数
	 */
	Integer updatePwdByUid(
			@Param("uid")Integer uid,
			@Param("pwd")String pwd,
			@Param("modifiedTime")Date modifiedTime);
	
	/**
	 * 通过用户id查询用户数据,包括对应的原密码,盐值,用来验证密码是否正确
	 * @param uid 用户id
	 * @return 返回用户数据
	 */
	User findByUid(Integer uid);
	
	/**
	 * 通过用户名查询用户数据,判断是否重名
	 * @param uname 用户名
	 * @return 匹配的用户数据,若无匹配则为null
	 */
	User findByUname(String uname);
	
}
