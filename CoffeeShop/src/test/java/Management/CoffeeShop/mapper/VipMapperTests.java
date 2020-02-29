package Management.CoffeeShop.mapper;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import Management.CoffeeShop.entity.Vip;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VipMapperTests {
	
	/**
	 * 自动装载接口
	 */
	@Autowired 
	private VipMapper vipMapper;
	
	/**
	 * 插入会员数据测试
	 */
	@Test
	public void insert(){
		Vip vip = new Vip();
		vip.setVname("小王");
		vip.setVphone("123456");
		vip.setVmoney(100);
		Date now = new Date();
		vip.setRegTime(now);
		Integer rows = vipMapper.insert(vip);
		System.err.println("插入数据:"+rows+"行");
	}
	
	/**
	 * 更新手机号
	 */
	@Test
	public void updateVphoneByVid(){
		Integer vid = 1;
		String vphone = "1333";
		Integer rows = vipMapper.updateVphoneByVid(vid, vphone);
		System.err.println("通过vid更新数据:"+rows+"条");
	}
	
	/**
	 * 更新余额
	 */
	@Test
	public void updateVmoneyByVphone(){
		double vmoney = 999;
		String vphone = "13736646928";
		Integer rows = vipMapper.updateVmoneyByVphone(vmoney, vphone);
		System.err.println("通过vmoney更新数据:"+rows+"条");
	}
	
	/**
	 * 通过会员名查询会员数据
	 */
	@Test
	public void findByVid(){
		Integer vid = 3;
		Vip result = vipMapper.findByVid(vid);
		System.err.println("通过vid得到的用户数据:"+result);
	}
	
	/**
	 * 通过会员名查询会员数据
	 */
	@Test
	public void findByVname(){
		String vname = "小王";
		Vip result = vipMapper.findByVname(vname);
		System.err.println("通过会员名称得到的会员数据:"+result);
	}
	
	/**
	 * 通过会员手机号查询会员数据
	 */
	@Test
	public void findByVphone(){
		String vphone = "178";
		Vip result = vipMapper.findByVphone(vphone);
		System.err.println("通过会员手机号得到的会员数据:"+result);
	}
	
	/**
	 * 删除
	 */
	@Test
	public void deleteByVphone1(){
		String vphone = "17816512121";
		Integer rows = vipMapper.deleteByVphone(vphone);
		System.err.println("删除的个数:"+rows);
	}
	
}
