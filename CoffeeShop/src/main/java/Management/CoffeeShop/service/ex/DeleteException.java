package Management.CoffeeShop.service.ex;
/**
 * 删除异常
 * @author nbtarena
 *
 */
public class DeleteException extends ServiceException {

	private static final long serialVersionUID = -8682013719052522547L;

	public DeleteException() {
	}

	public DeleteException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public DeleteException(String message, Throwable cause) {
		super(message, cause);
	}

	public DeleteException(String message) {
		super(message);
	}

	public DeleteException(Throwable cause) {
		super(cause);
	}

}
