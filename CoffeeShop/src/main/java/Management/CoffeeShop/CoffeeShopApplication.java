package Management.CoffeeShop;



import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.unit.DataSize;

import javax.servlet.MultipartConfigElement;

@SpringBootApplication
@MapperScan("Management.CoffeeShop.mapper") //扫描配置接口文件所在的包
@Configuration
public class CoffeeShopApplication {

	public static void main(String[] args) {
		System.out.println("hello");
		SpringApplication.run(CoffeeShopApplication.class, args);
	}

	//自定义上传的文件的大小
	@Bean
	public MultipartConfigElement getMultipartConfigElement() {
	    MultipartConfigFactory factory = new MultipartConfigFactory();

	    factory.setMaxFileSize(DataSize.ofMegabytes(50));
	    factory.setMaxRequestSize(DataSize.ofMegabytes(50));

	    return factory.createMultipartConfig();
	}
}
