package Management.CoffeeShop.service.ex;
/**
 * 密码不匹配异常
 * @author nbtarena
 *
 */
public class VphoneNotMatchException extends ServiceException {

	private static final long serialVersionUID = -6529837675322000009L;

	public VphoneNotMatchException() {
	}

	public VphoneNotMatchException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public VphoneNotMatchException(String message, Throwable cause) {
		super(message, cause);
	}

	public VphoneNotMatchException(String message) {
		super(message);
	}

	public VphoneNotMatchException(Throwable cause) {
		super(cause);
	}

}
