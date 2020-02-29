package Management.CoffeeShop.service.ex;
/**
 * 文件状态异常
 * @author nbtarena
 *
 */
public class FileStateException extends FileUploadException {

	private static final long serialVersionUID = 4423985020038659058L;

	public FileStateException() {
	}

	public FileStateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public FileStateException(String message, Throwable cause) {
		super(message, cause);
	}

	public FileStateException(String message) {
		super(message);
	}

	public FileStateException(Throwable cause) {
		super(cause);
	}

}
