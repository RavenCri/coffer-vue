package Management.CoffeeShop.service.ex;
/**
 * 文件上传异常的基类
 * @author nbtarena
 *
 */
public class FileUploadException extends RuntimeException {

	private static final long serialVersionUID = 3898462074842795976L;

	public FileUploadException() {
	}

	public FileUploadException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FileUploadException(String message, Throwable cause) {
		super(message, cause);
	}

	public FileUploadException(String message) {
		super(message);
	}

	public FileUploadException(Throwable cause) {
		super(cause);
	}

}
