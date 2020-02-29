package Management.CoffeeShop.service.ex;
/**
 * 密码长度过短异常
 * @author nbtarena
 *
 */
public class PwdLengthException extends ServiceException {

	private static final long serialVersionUID = -5263920641961539006L;

	public PwdLengthException() {
	}

	public PwdLengthException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public PwdLengthException(String message, Throwable cause) {
		super(message, cause);
	}

	public PwdLengthException(String message) {
		super(message);
	}

	public PwdLengthException(Throwable cause) {
		super(cause);
	}

}
