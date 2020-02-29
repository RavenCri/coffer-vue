package Management.CoffeeShop.service.ex;
/**
 * 上传图片异常
 * @author nbtarena
 *
 */
public class UploadException extends ServiceException {

	private static final long serialVersionUID = -7113553038599260481L;

	public UploadException() {
	}

	public UploadException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UploadException(String message, Throwable cause) {
		super(message, cause);
	}

	public UploadException(String message) {
		super(message);
	}

	public UploadException(Throwable cause) {
		super(cause);
	}

}
