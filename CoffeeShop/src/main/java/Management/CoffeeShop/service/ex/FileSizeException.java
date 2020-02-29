package Management.CoffeeShop.service.ex;
/**
 * 文件大小异常
 * @author nbtarena
 *
 */
public class FileSizeException extends FileUploadException {

	private static final long serialVersionUID = -53909424989063181L;

	public FileSizeException() {
	}

	public FileSizeException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FileSizeException(String message, Throwable cause) {
		super(message, cause);
	}

	public FileSizeException(String message) {
		super(message);
	}

	public FileSizeException(Throwable cause) {
		super(cause);
	}

}
