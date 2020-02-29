package Management.CoffeeShop.conf;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import Management.CoffeeShop.interceptor.LoginInterceptor;
/**
 * 登陆拦截器配置类
 * @author nbtarena
 *
 */
@Configuration //拦截器配置注解必须添加
public class LoginInterceptorConfigurer implements WebMvcConfigurer{

	//重写添加拦截器接口
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//创建拦截器对象
		HandlerInterceptor interceptor = new LoginInterceptor();
		//白名单:不拦截的资源
		List<String> patterns = new ArrayList<>();
		patterns.add("/bootstrap3/**");
		patterns.add("/css/**");
		patterns.add("/images/**");
		patterns.add("/js/**");
		patterns.add("/web/reg.html");
		patterns.add("/web/login.html");
		patterns.add("/user/reg");
		patterns.add("/user/login");

		//添加注册拦截器
		registry.addInterceptor(interceptor)
			.addPathPatterns("/**")
			.excludePathPatterns(patterns);
	}


}
