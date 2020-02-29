package Management.CoffeeShop.service.ex;
/**
 * 密码不匹配异常
 * @author nbtarena
 *
 */
public class PwdNotMatchException extends ServiceException {

	private static final long serialVersionUID = -6529837675322000009L;

	public PwdNotMatchException() {
	}

	public PwdNotMatchException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public PwdNotMatchException(String message, Throwable cause) {
		super(message, cause);
	}

	public PwdNotMatchException(String message) {
		super(message);
	}

	public PwdNotMatchException(Throwable cause) {
		super(cause);
	}

}
