package Management.CoffeeShop.service.ex;
/**
 * 购物车未找到异常
 * @author nbtarena
 *
 */
public class CartNotDelNumException extends ServiceException {

	private static final long serialVersionUID = -9160117917930159370L;

	public CartNotDelNumException() {
	}

	public CartNotDelNumException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public CartNotDelNumException(String message, Throwable cause) {
		super(message, cause);
	}

	public CartNotDelNumException(String message) {
		super(message);
	}

	public CartNotDelNumException(Throwable cause) {
		super(cause);
	}

}
