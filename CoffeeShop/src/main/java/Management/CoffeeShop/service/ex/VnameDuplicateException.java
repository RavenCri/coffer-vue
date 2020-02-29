package Management.CoffeeShop.service.ex;
/**
 * 会员名重复异常
 * @author nbtarena
 *
 */
public class VnameDuplicateException extends ServiceException {

	private static final long serialVersionUID = -987984413925175965L;

	public VnameDuplicateException() {
	}

	public VnameDuplicateException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public VnameDuplicateException(String message, Throwable cause) {
		super(message, cause);
	}

	public VnameDuplicateException(String message) {
		super(message);
	}

	public VnameDuplicateException(Throwable cause) {
		super(cause);
	}

}
