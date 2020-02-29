package Management.CoffeeShop.service.ex;
/**
 * 更新数据异常
 * @author nbtarena
 *
 */
public class UpdateException extends ServiceException {

	private static final long serialVersionUID = 2593831302471787461L;

	public UpdateException() {
	}

	public UpdateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UpdateException(String message, Throwable cause) {
		super(message, cause);
	}

	public UpdateException(String message) {
		super(message);
	}

	public UpdateException(Throwable cause) {
		super(cause);
	}

}
