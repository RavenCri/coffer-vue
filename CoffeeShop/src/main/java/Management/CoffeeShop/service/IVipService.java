package Management.CoffeeShop.service;

import java.util.List;

import Management.CoffeeShop.entity.Vip;

/**
 * 处理会员相关业务的接口
 * @author nbtarena
 *
 */
public interface IVipService {
	
	/**
	 * 会员注册
	 * @param vip 新会员的信息
	 */
	String reg(Vip vip);
	
	
	/**
	 * 修改手机号
	 * @param vid 会员id
	 * @param oldVphone 旧密码
	 * @param newVphone 新密码
	 */
	void changeVphone(Integer vid,String oldVphone,String newVphone);
	
	/**
	 * 查询会员资料
	 * @param vid 会员id
	 * @return 返回会员资料
	 */
	Vip getInfo(Integer vid);
	
	/**
	 * 查询会员资料
	 * @param vphone 会员vphone
	 * @return 返回会员资料
	 */
	Vip findInfoByVphone(String vphone);


	/**
	 * 查询所有会员资料
	 * @return 返回会员资料
	 */
	List<Vip> findAllInfo();
	
	/**
	 * 充值功能
	 * @return
	 */
	void addVmoney(double vmoney,String vphone);

	/**
	 * 删除会员
	 * @param vphone
	 */
	void delete(String vphone);


	Vip vipLogin(String vip_id);

	 void updateMoney(double vmoney, Vip vip);

    void updateVipInfo(Vip vip);
}
