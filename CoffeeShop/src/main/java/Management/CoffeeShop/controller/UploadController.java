package Management.CoffeeShop.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.omg.CORBA_2_3.portable.OutputStream;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * 上传控制器类
 * @author nbtarena
 *
 */
@Controller
public class UploadController extends BaseController{
	private static String prefix =  "c:\\images\\";
	@PostMapping("upload")
	@ResponseBody
	public String handleUpload(@RequestParam("file") MultipartFile file) throws IllegalStateException, IOException {
	    if(file.isEmpty()){
	    	return "error";
		}
		System.out.println("UploadController.handleUpload()");
		String fileName = RandomStringUtils.randomAlphanumeric(10);
	    File dest = new File(prefix+fileName+".jpg");
		JSONObject obj = new JSONObject();
		obj.put("code",0);
		obj.put("msg","");
		obj.put("data",new JSONObject().fluentPut("filename",fileName));
	    file.transferTo(dest);
	    return obj.toJSONString();
	}

	@GetMapping(value = "/getGoodsImg",produces = MediaType.IMAGE_JPEG_VALUE)
	@ResponseBody
	public byte[] getImage(String filename) throws IOException {
		File file = new File(prefix+filename+".jpg");

		FileInputStream inputStream = new FileInputStream(file);
		byte[] bytes = new byte[inputStream.available()];
		inputStream.read(bytes, 0, inputStream.available());
		inputStream.close();

		return bytes;



	}
}
