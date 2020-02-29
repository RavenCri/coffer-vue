package Management.CoffeeShop.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
/**
 * 拦截器
 * @author nbtarena
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest req,HttpServletResponse res,Object handle) throws IOException{
		//从request中获取session存储的信息
		HttpSession session = req.getSession();
			System.out.println(req.getServletPath());

//		//如果存储的uid为空,则重定向至登陆页面
//		if(session.getAttribute("uid") == null ){
//			if(req.getServletPath().equals("/goods/goods")
//					|| req.getServletPath().equals("/goods/newGoods")
//					|| req.getServletPath().equals("/getGoodsImg")
//					|| req.getServletPath().equals("/orderManager")){
//				return true;
//			}
//			res.sendRedirect("/web/login.html");
//			//阻止运行
//			return false;
//		}

		if(req.getServletPath().equals("/web/goods-add.html") ||req.getServletPath().equals("/goodAdd.html")){
			res.sendRedirect("/good_add");
			return true;
		}
//
		//放行
		return true;
	}
	
}
