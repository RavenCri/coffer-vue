package Management.CoffeeShop.service.ex;
/**
 * 会员数据未找到异常
 * @author nbtarena
 *
 */
public class CartNotEqualsException extends ServiceException {

	private static final long serialVersionUID = -6552360950966512090L;

	public CartNotEqualsException() {
	}

	public CartNotEqualsException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public CartNotEqualsException(String message, Throwable cause) {
		super(message, cause);
	}

	public CartNotEqualsException(String message) {
		super(message);
	}

	public CartNotEqualsException(Throwable cause) {
		super(cause);
	}

}
