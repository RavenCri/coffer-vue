package Management.CoffeeShop.service.ex;
/**
 * 用户名重复异常
 * @author nbtarena
 *
 */
public class UnameDuplicateException extends ServiceException {

	private static final long serialVersionUID = 1794367021361857062L;

	public UnameDuplicateException() {
	}

	public UnameDuplicateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UnameDuplicateException(String message, Throwable cause) {
		super(message, cause);
	}

	public UnameDuplicateException(String message) {
		super(message);
	}

	public UnameDuplicateException(Throwable cause) {
		super(cause);
	}

}
