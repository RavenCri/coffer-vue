package Management.CoffeeShop.service.ex;
/**
 * 文件为空异常
 * @author nbtarena
 *
 */
public class FileEmptyException extends FileUploadException {

	private static final long serialVersionUID = 5299128477692396826L;

	public FileEmptyException() {
	}

	public FileEmptyException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FileEmptyException(String message, Throwable cause) {
		super(message, cause);
	}

	public FileEmptyException(String message) {
		super(message);
	}

	public FileEmptyException(Throwable cause) {
		super(cause);
	}

}
