package Management.CoffeeShop.service.impl;

import java.util.Date;

import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.mapper.VipMapper;
import Management.CoffeeShop.service.IVipService;
import Management.CoffeeShop.service.ex.DeleteException;
import Management.CoffeeShop.service.ex.InsertException;
import Management.CoffeeShop.service.ex.UpdateException;
import Management.CoffeeShop.service.ex.VipNotFoundException;
import Management.CoffeeShop.service.ex.VnameDuplicateException;
import Management.CoffeeShop.service.ex.VphoneNotMatchException;

/**
 * 实现业务
 * @author nbtarena
 *
 */
@Service //spring启动会创建该对象
public class VipServiceImpl implements IVipService{

	@Autowired
	private VipMapper vipMapper;

	/**
	 * 注册功能
	 */
	@Override
	public String reg(Vip vip) {
		// 根据参数vip对象中的vphone属性查询会员数据
		Vip result = vipMapper.findByVphone(vip.getVphone());
		// 判断查询结果是否不为null
		if(result!=null){
			// 是：抛出VnameDuplicateException对象
			throw new VnameDuplicateException();
		}
		//判断手机号是否符合11位数(首位为1,第二位可为3,5,7,8,剩余9位随机)
		String vphone = vip.getVphone();
		String regex = "[1][3578]\\d{9}";
		//先判断手机号码长度是否为11位数
		if(vphone.length()!=11){
			throw new VphoneNotMatchException();
		}
		//先判断手机号码是否符合现实运营商的号码
		if(!vphone.matches(regex)){
			throw new VphoneNotMatchException();
		}
		String vname = vip.getVname();
		vip.setVname(vname);
		//会员类型
		int vtype = vip.getVtype();
		double vmoney = 0;
		int vdiscount = 0;
		if(vtype == 0){
			//储蓄卡
			//100倍数充值,获得的是110元,也就是满100送10元,满300送30
			vmoney = vip.getVmoney()*1.1;
		}else{
			//折扣卡
			vmoney = vip.getVmoney();
			//打9折,结算时需要除以100
			vdiscount = 90;
		}
		String id = RandomStringUtils.randomNumeric(10);
		vip.setVip_id(id);
		vip.setVmoney(vmoney);
		vip.setVdiscount(vdiscount);
		//注册日期,不可更改
		Date now = new Date();
		vip.setRegTime(now);
		vip.setCount(0);
		vip.setCost_money(0);
		vip.setExp(0);
		// 调用vipMapper的insert()方法执行注册，获取返回的受影响行数
		Integer rows = vipMapper.insert(vip);
		// 判断受影响的行数是否不为1
		if(rows != 1){
			// 是：表示注册失败，则抛出InsertException对象
			throw new InsertException();
		}
		return id;
	}


	/**
	 * 修改手机号码
	 */
	@Override
	public void changeVphone(Integer vid, String oldVphone, String newVphone) {
		// 根据参数vid查询会员数据
		Vip result = vipMapper.findByVid(vid);
		// 判断查询结果是否为null
		if(result == null){
			// 是：UserNotFoundException
			throw new VipNotFoundException("会员未找到");
		}
		// 判断oldVphone与查询结果中的手机号码是否不同
		System.err.println("查询出的旧手机的号码:"+result.getVphone());
		System.err.println("id:"+vid);
		System.err.println("旧手机的号码:"+oldVphone);
		System.err.println("新手机的号码:"+newVphone);
		if(!result.getVphone().equals(oldVphone)){
			// 是：抛出VphoneNotMatchException
			throw new VphoneNotMatchException("原手机号码错误");
		}
		// 执行修改手机号码，并获取受影响的行数
		String regex = "[1][3578]\\d{9}";
		//先判断手机号码长度是否为11位数
		if(newVphone.length()!=11){
			throw new VphoneNotMatchException("新手机号码应为11位数!");
		}
		//判断手机号码是否符合现实运营商的号码
		if(!newVphone.matches(regex)){
			throw new VphoneNotMatchException("新手机号码格式不对!");
		}
		//还需要判断新的手机号码是否已经存在,若已存在,也无法进行修改
		Vip result1 = vipMapper.findByVphone(newVphone);
		if(result1!=null){
			throw new VnameDuplicateException("会员重复异常!");
		}
		//全部都符合,进行修改手机号码
		Integer rows = vipMapper.updateVphoneByVid(vid, newVphone);
		System.err.println("修改手机号码受影响的条数:"+rows+"条");
		// 判断受影响的行数是否不为1
		if(rows!=1){
			// 是：抛出UpdateException
			throw new UpdateException("更新手机号码时出现未知错误,请联系系统管理员!");
		}
	}

	/**
	 * 获取会员资料
	 */
	@Override
	public Vip getInfo(Integer vid) {
		// 根据参数vid查询会员数据
		Vip result = vipMapper.findByVid(vid);
		// 判断查询结果是否为null
		if(result == null){
			// 是：UserNotFoundException
			throw new VipNotFoundException("会员数据不存在");
		}
		//创建新的vip对象
		Vip vip = new Vip();
		//封装数据(根据vid查询的用户数据)
		vip.setVname(result.getVname());
		return vip;
	}

	/**
	 * 查询所有会员信息
	 */
	@Override
	public List<Vip> findAllInfo() {
		System.err.println(vipMapper.findAllInfo());
		return vipMapper.findAllInfo();
	}


	/**
	 * 根据手机号查询会员信息
	 */
	@Override
	public Vip findInfoByVphone(String vphone) {
		// 根据参数vphone查询会员数据
		Vip result = vipMapper.findByVphone(vphone);
		// 判断查询结果是否为null
		if(result==null){
			throw new VipNotFoundException("会员数据不存在");
		}
		System.err.println("根据手机号查询会员信息"+result);
		return result;
	}


	/**
	 * 根据手机号更新余额
	 */
	@Override
	public void addVmoney(double vmoney, String vphone) {
		// 根据参数vip对象中的vphone属性查询会员数据
		Vip result = vipMapper.findByVphone(vphone);
		// 判断查询结果是否不为null
		if(result==null){
			throw new VipNotFoundException("会员数据不存在");
		}
		double oldVmoney = result.getVmoney();
		//会员类型
		int vtype = result.getVtype();
		int vdiscount = 0;
		if(vtype == 0){
			//储蓄卡
			if(vmoney<=500){
				//充值500以内,获得的是110元,也就是满100送10元,满300送30
				vmoney = vmoney*1.1;
			}else if(vmoney>500&&vmoney<=1000){
				//充值500到1000的,也就是满600送120元
				vmoney = vmoney*1.2;
			}else if(vmoney>1000){
				//充值1000+的,也就是满1000送300元
				vmoney = vmoney*1.3;
			}
		}else{
			//折扣卡
			//打9折,结算时需要除以100
			vdiscount = 90;
		}
		vmoney = oldVmoney+vmoney;
		System.err.println("旧钱"+oldVmoney);
		System.err.println("新钱"+vmoney);
		// 调用vipMapper的updateVmoneyByVphone()方法获取返回的受影响行数
		Integer rows = vipMapper.updateVmoneyByVphone(vmoney,vphone);
		System.err.println("更新余额条数:"+rows);
		// 判断受影响的行数是否不为1
		if(rows != 1){
			// 是：表示注册失败，则抛出InsertException对象
			throw new InsertException();
		}
	}


	/**
	 * 删除会员
	 */
	@Override
	public void delete(String vphone) {
		Vip result = vipMapper.findByVphone(vphone);
		//判断查询结果是否为 null
		if(result==null){
			//是:AddressNotFoundException
			throw new VipNotFoundException("会员未找到");
		}
		Integer rows = vipMapper.deleteByVphone(vphone);
		//判断受影响的行数是否不为1
		if(rows!=1){
			//是:DeleteException()
			throw new DeleteException();
		}
		System.err.println("删除会员个数:"+rows);
	}

	@Override
	public Vip vipLogin(String vip_id) {
		System.out.println(vip_id);
		Vip vip = vipMapper.getVipByVipId(vip_id);
		System.out.println(vip);
		return vip;

	}

	@Override
	public void updateMoney(double vmoney, Vip vip) {
		vipMapper.updateVmoneyByVphone(vmoney,vip.getVphone());
	}

	@Override
	public void updateVipInfo(Vip vip) {
		vipMapper.updateVipInfo(vip);
	}


}
