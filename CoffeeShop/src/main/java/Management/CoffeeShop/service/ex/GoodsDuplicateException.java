package Management.CoffeeShop.service.ex;
/**
 * 用户名重复异常
 * @author nbtarena
 *
 */
public class GoodsDuplicateException extends ServiceException {

	private static final long serialVersionUID = 1794367021361857062L;

	public GoodsDuplicateException() {
	}

	public GoodsDuplicateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public GoodsDuplicateException(String message, Throwable cause) {
		super(message, cause);
	}

	public GoodsDuplicateException(String message) {
		super(message);
	}

	public GoodsDuplicateException(Throwable cause) {
		super(cause);
	}

}
