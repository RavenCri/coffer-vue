package Management.CoffeeShop.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import Management.CoffeeShop.entity.User;
import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.service.ex.ServiceException;

/**
 * 实现会员各业务功能
 * @author nbtarena
 *
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class VipServiceTests {

	@Autowired 
	private IVipService vipService;
	
	/**
	 * 注册测试
	 */
	@Test
	public void reg(){
		try {
			Vip vip = new Vip();
			vip.setVname("小李");
			vip.setVphone("11816559780");
			vip.setVmoney(300);
			vipService.reg(vip);
			System.err.println("会员注册成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 修改手机号码
	 */
	@Test
	public void updateVphoneByVid(){
		try {
			Integer vid = 1;
			String oldVphone = "15633333331";
			String newVphone = "15611111112";
			vipService.changeVphone(vid, oldVphone, newVphone);
			System.err.println("修改手机号码成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 修改余额
	 */
	@Test
	public void addVmoney(){
		try {
			double vmoney=30;
			String vphone = "13300000000";
			vipService.addVmoney(vmoney,vphone);
			System.err.println("修改手机号码成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 获取会员资料
	 */
	@Test
	public void getInfo(){
		try {
			Integer vid = 9;
			Vip result = vipService.getInfo(vid);
			System.err.println("获取会员资料成功!");
			System.err.println(result);
		} catch (ServiceException e) {
			System.err.println(e.getClass());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 删除会员
	 */
	@Test
	public void deleteVip(){
		try {
			String vphone = "13333333324";
			vipService.delete(vphone);
			System.err.println("删除会员成功!");
		} catch (ServiceException e) {
			System.err.println(e.getClass().getSimpleName());
			System.err.println(e.getMessage());
		}
	}
	
	/**
	 * 通过会员手机号查询会员数据
	 */
	@Test
	public void findByVphone(){
		String vphone = "17816559722";
		Vip result = vipService.findInfoByVphone(vphone);
		System.err.println("通过会员手机号得到的会员数据:"+result);
	}
}
