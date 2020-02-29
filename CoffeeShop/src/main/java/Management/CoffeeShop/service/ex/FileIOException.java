package Management.CoffeeShop.service.ex;
/**
 * 文件传输异常
 * @author nbtarena
 *
 */
public class FileIOException extends FileUploadException {

	private static final long serialVersionUID = -4621822781968119630L;

	public FileIOException() {
	}

	public FileIOException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FileIOException(String message, Throwable cause) {
		super(message, cause);
	}

	public FileIOException(String message) {
		super(message);
	}

	public FileIOException(Throwable cause) {
		super(cause);
	}

}
