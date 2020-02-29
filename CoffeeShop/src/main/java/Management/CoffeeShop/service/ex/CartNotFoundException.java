package Management.CoffeeShop.service.ex;
/**
 * 购物车未找到异常
 * @author nbtarena
 *
 */
public class CartNotFoundException extends ServiceException {

	private static final long serialVersionUID = -9160117917930159370L;

	public CartNotFoundException() {
	}

	public CartNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public CartNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public CartNotFoundException(String message) {
		super(message);
	}

	public CartNotFoundException(Throwable cause) {
		super(cause);
	}

}
