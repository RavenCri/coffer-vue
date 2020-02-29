package Management.CoffeeShop.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;

import Management.CoffeeShop.service.ex.CartNotDelNumException;
import Management.CoffeeShop.service.ex.CartNotEqualsException;
import Management.CoffeeShop.service.ex.DeleteException;
import Management.CoffeeShop.service.ex.FileEmptyException;
import Management.CoffeeShop.service.ex.FileIOException;
import Management.CoffeeShop.service.ex.FileSizeException;
import Management.CoffeeShop.service.ex.FileStateException;
import Management.CoffeeShop.service.ex.FileTypeException;
import Management.CoffeeShop.service.ex.FileUploadException;
import Management.CoffeeShop.service.ex.GoodsDuplicateException;
import Management.CoffeeShop.service.ex.GoodsNotFoundException;
import Management.CoffeeShop.service.ex.InsertException;
import Management.CoffeeShop.service.ex.PwdLengthException;
import Management.CoffeeShop.service.ex.PwdNotMatchException;
import Management.CoffeeShop.service.ex.ServiceException;
import Management.CoffeeShop.service.ex.UnameDuplicateException;
import Management.CoffeeShop.service.ex.UpdateException;
import Management.CoffeeShop.service.ex.UploadException;
import Management.CoffeeShop.service.ex.UserNotFoundException;
import Management.CoffeeShop.service.ex.VipNotFoundException;
import Management.CoffeeShop.service.ex.VnameDuplicateException;
import Management.CoffeeShop.service.ex.VphoneNotMatchException;
import Management.CoffeeShop.util.JsonResult;

/**
 * 控制器的基类
 * @author nbtarena
 *
 */
public abstract class BaseController {

	/**
	 * 操作成功的状态码
	 */
	public static final int OK = 2000;
	/**
	 * 统一异常处理
	 * @param e 该异常参数范围大于所有异常的类型
	 * @return JsonResult的响应码和信息
	 */
	//限制处理范围,处理ServiceException和FileUploadException类型的异常,包括它的子类异常
	@ExceptionHandler({ServiceException.class, FileUploadException.class}) 
	public JsonResult<Void> handleException(Throwable e){
		JsonResult<Void> jr = new JsonResult<>();
		if(e instanceof UnameDuplicateException){
			jr.setState(4000); //一般出现异常都是400以上,我取4000,防止相同
			jr.setMessage("用户名已存在!请重新输入");
		}
		if(e instanceof InsertException){
			jr.setState(4001);
			jr.setMessage("添加用户数据异常!");
		}
		if(e instanceof UserNotFoundException){
			jr.setState(4002);
			jr.setMessage("用户名不存在!请重新输入");
		}
		if(e instanceof PwdNotMatchException){
			jr.setState(4003);
			jr.setMessage("密码不匹配!请重新输入");
		}
		if(e instanceof PwdLengthException){
			jr.setState(4004);
			jr.setMessage("密码长度小于6,安全性较低!请重新输入");
		}
		if(e instanceof UpdateException){
			jr.setState(4005);
			jr.setMessage("更新出现故障!");
		}
		if(e instanceof VipNotFoundException){
			jr.setState(4006);
			jr.setMessage("该会员不存在!请重新输入");
		}
		if(e instanceof VnameDuplicateException){
			jr.setState(4007);
			jr.setMessage("该会员已存在!请重新输入");
		}
		if(e instanceof VphoneNotMatchException){
			jr.setState(4008);
			jr.setMessage("输入有误!号码已存在或者请查看输入的手机号码格式,再重新输入!");
		}
		if(e instanceof DeleteException){
			jr.setState(4009);
			jr.setMessage("删除会员出现未知错误,请联系系统管理员");
		}
		if(e instanceof GoodsDuplicateException){
			jr.setState(4010);
			jr.setMessage("商品重复!");
		}
		if(e instanceof GoodsNotFoundException){
			jr.setState(4011);
			jr.setMessage("商品未找到!");
		}
		if(e instanceof UploadException){
			jr.setState(4012);
			jr.setMessage("上传图片失败!");
		}
		if(e instanceof FileEmptyException){
			jr.setState(4013);
			jr.setMessage("文件不能为空!");
		}
		if(e instanceof FileIOException){
			jr.setState(4014);
			jr.setMessage("文件传输失败!");
		}
		if(e instanceof FileSizeException){
			jr.setState(4015);
			jr.setMessage("文件大小超过限制!");
		}
		if(e instanceof FileStateException){
			jr.setState(4016);
			jr.setMessage("文件状态有问题!");
		}
		if(e instanceof FileTypeException){
			jr.setState(4017);
			jr.setMessage("文件类型超出了限制!");
		}
		if(e instanceof CartNotEqualsException){
			jr.setState(4018);
			jr.setMessage("订单数据不对！");
		}
		if(e instanceof CartNotDelNumException){
			jr.setState(4019);
			jr.setMessage("订单数量至少要有1个！");
		}
		return jr;
	}
}
