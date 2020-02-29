package Management.CoffeeShop.service.ex;
/**
 * 文件类型异常
 * @author nbtarena
 *
 */
public class FileTypeException extends FileUploadException {

	private static final long serialVersionUID = -6304590993960544833L;

	public FileTypeException() {
	}

	public FileTypeException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FileTypeException(String message, Throwable cause) {
		super(message, cause);
	}

	public FileTypeException(String message) {
		super(message);
	}

	public FileTypeException(Throwable cause) {
		super(cause);
	}

}
