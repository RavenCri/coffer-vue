package Management.CoffeeShop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import Management.CoffeeShop.entity.Goods;
import Management.CoffeeShop.service.IGoodsService;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import Management.CoffeeShop.entity.Vip;
import Management.CoffeeShop.service.IVipService;
import Management.CoffeeShop.util.JsonResult;

/**
 * 会员控制器类
 * @author nbtarena
 *
 */
@RestController
@RequestMapping("vip")
public class VipController extends BaseController{

	@Autowired
	private IVipService service;

	/**
	 * 注册会员
	 * @param vip
	 * @return
	 */
	@RequestMapping("reg")
	@ResponseBody
	public JsonResult<Void> reg(Vip vip){
		//调用vipService的reg()方法实现注册
		System.err.println("1");
		System.err.println("3");
		String vipId = service.reg(vip);
		System.err.println("2");
		//返回状态码OK
		JsonResult<Void> json = new JsonResult<>(OK);
		json.setMessage(vipId);

		return  json;
	}
	@RequestMapping("/creditExchange")
	public void updateVipInfo(@RequestBody JSONObject jsonObject){
		String vipId = jsonObject.getString("vipId");
		int credit = jsonObject.getInteger("credit");
		Vip vip = service.vipLogin(vipId);
		vip.setCredit(vip.getCredit()-credit);
		service.updateVipInfo(vip);
	}
	@RequestMapping("/signInRedictAdd")
	public void signInRedictAdd(@RequestBody JSONObject jsonObject){
		String vipId = jsonObject.getString("vipId");

		Vip vip = service.vipLogin(vipId);
		vip.setCredit(vip.getCredit()+20);
		service.updateVipInfo(vip);
	}
	/**
	 * vip登陆
	 * @return
	 */
	@PostMapping(value = "login")
	@ResponseBody
	public JsonResult vipLogin(@RequestBody JSONObject json){

		Vip vip = service.vipLogin(json.getString("vipId"));
		JsonResult jsonResult = new JsonResult();
		if(vip == null){
			jsonResult.setState(404);
			jsonResult.setMessage("该卡号不存在！");

		}else{
			jsonResult.setState(200);
			JSONObject res = new JSONObject();
			res.put("credit",vip.getCredit());
			res.put("money",vip.getVmoney());
			res.put("name",vip.getVname());
			res.put("vipId",vip.getVip_id());
			jsonResult.setMessage(res.toJSONString());
		}
		return  jsonResult;

	}
	/**
	 * 先进行管理员登陆,修改手机号码
	 * @param oldPwd 旧手机号码
	 * @param newPwd 新手机号码
	 * @param session 存储登陆的id
	 * @return 返回给客户端状态码
	 */
	@RequestMapping("change_pwd")
	@ResponseBody
	public JsonResult<Void> changeVphone(String oldVphone,String newVphone,HttpSession session){
		//从session中获取vid和vname
		System.err.println("1");
		Integer vid = Integer.valueOf(session.getAttribute("vid").toString());
		//String vname = session.getAttribute("vname").toString();
		//调用vipService的changeVphone()方法实现修改密码
		service.changeVphone(vid, oldVphone, newVphone);
		System.err.println("2");
		return new JsonResult<Void>(OK);
	}

	/**
	 * 获取会员信息
	 * @param session 存储vid
	 * @return 返回用户信息
	 */
	@GetMapping("info")
	public JsonResult<Vip> getInfo(HttpSession session){
		//获取登陆后的session保存的uid值
		System.err.println("3");
		Integer vid = Integer.valueOf(session.getAttribute("vid").toString());
		//调用userService的getInfo方法实现功能
		Vip vip = service.getInfo(vid);
		System.err.println("4");
		//返回状态码和相应数据
		return new JsonResult<>(OK,vip);
	}
	
	/**
	 * 获取所有会员信息
	 * @return 返回用户信息
	 */
	@RequestMapping("allInfo")
    public List<Vip> ShowAllInfo(Model model){
		List<Vip> info=service.findAllInfo();
		System.err.println(info);
        return info;
    }
	
	/**
	 * 根据手机号查找会员信息
	 * @return 返回用户信息
	 */
	@RequestMapping("InfoByVphone")
    public Vip ShowInfoByVphone(String vphone){
		Vip info=service.findInfoByVphone(vphone);
		System.err.println(info);
        return info;
    }
	
	/**
	 * 根据手机号查找会员信息,用于订单
	 * @return 返回用户信息
	 */
	@RequestMapping("ByVphone")
    public JsonResult<Vip> InfoByVphone(String vphone){
		System.out.println(111);
		Vip vip=service.findInfoByVphone(vphone);
		System.out.println(2);
		System.out.println(vip);
		System.out.println(3);
        return new JsonResult<>(OK,vip);
    }
	
	/**
	 * 修改手机号
	 * @return 返回用户信息
	 */
	@RequestMapping("{vid}/updateVphone")
    public JsonResult<Void> updateVphoneByVid(@PathVariable("vid")Integer vid,String oldVphone,String newVphone){
		System.err.println(vid+","+oldVphone+","+newVphone);
		service.changeVphone(vid,oldVphone,newVphone);
		System.err.println("修改成功!");
		return new JsonResult<>(OK);
    }
	
	/**
	 * 充值
	 * @return 返回用户信息
	 */
	@RequestMapping("{vphone}/addVmoney")
    public JsonResult<Void> addVmoney(double vmoney,@PathVariable("vphone")String vphone){
		System.err.println(vmoney+","+vphone);
		service.addVmoney(vmoney,vphone);
		System.err.println("充值成功!");
		return new JsonResult<>(OK);
    }
	
	/**
	 * 删除会员
	 * @param vip
	 * @return
	 */
	@RequestMapping("{vphone}/delete")
	@ResponseBody
	public JsonResult<Void> deleteVip(@PathVariable("vphone")String vphone){
		service.delete(vphone);
		System.err.println("删除成功!");
		//返回状态码OK
		return new JsonResult<>(OK);
	}
	
}
