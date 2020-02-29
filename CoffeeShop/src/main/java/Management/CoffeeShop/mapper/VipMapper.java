package Management.CoffeeShop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import Management.CoffeeShop.entity.Vip;

/**
 * 处理会员增删改查的持久层接口
 * @author nbtarena
 *
 */
public interface VipMapper {
	/**
	 * 插入会员数据
	 * @param vip 会员数据
	 * @return 受影响的行数
	 */
	Integer insert(Vip vip);
	
	/**
	 * 根据会员id更新手机号码
	 * @param vid 会员id
	 * @param phone 会员原手机号码
	 * @return 返回受影响的行数
	 */
	Integer updateVphoneByVid(
			@Param("vid")Integer vid,
			@Param("vphone")String vphone);
	
	/**
	 * 通过会员手机号查询用户数据
	 * @param vid 会员id
	 * @return 返回会员数据
	 */
	Vip findByVphone(String vphone);
	/**
	 * 通过会员id查询用户数据
	 * @param vid 会员id
	 * @return 返回会员数据
	 */
	Vip findByVid(Integer vid);
	
	/**
	 * 通过会员名查询会员数据,判断是否重名
	 * @param vname 会员名
	 * @return 匹配的用户数据,若无匹配则为null
	 */
	Vip findByVname(String vname);
	
	/**
	 * 查询所有会员信息
	 * @return 
	 */
	List<Vip> findAllInfo();
	
	/**
	 * 更新余额
	 * @param vmoney
	 * @param vphone
	 * @return
	 */
	Integer updateVmoneyByVphone(@Param("vmoney") double vmoney,@Param("vphone") String vphone);
	
	/**
	 * 根据手机号删除会员信息
	 * @param vphone
	 * @return
	 */
	Integer deleteByVphone(String vphone);

	Vip getVipByVipId(String vip_id);
}
