package Management.CoffeeShop.service.ex;
/**
 * 插入用户数据异常
 * @author nbtarena
 *
 */
public class InsertException extends ServiceException {

	private static final long serialVersionUID = 5777948034815625781L;

	public InsertException() {
	}

	public InsertException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public InsertException(String message, Throwable cause) {
		super(message, cause);
	}

	public InsertException(String message) {
		super(message);
	}

	public InsertException(Throwable cause) {
		super(cause);
	}

}
