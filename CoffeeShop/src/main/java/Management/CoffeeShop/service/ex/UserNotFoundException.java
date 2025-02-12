package Management.CoffeeShop.service.ex;
/**
 * 用户数据未找到异常
 * @author nbtarena
 *
 */
public class UserNotFoundException extends ServiceException {

	private static final long serialVersionUID = 7786007039559886745L;

	public UserNotFoundException() {
	}

	public UserNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UserNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public UserNotFoundException(String message) {
		super(message);
	}

	public UserNotFoundException(Throwable cause) {
		super(cause);
	}

}
