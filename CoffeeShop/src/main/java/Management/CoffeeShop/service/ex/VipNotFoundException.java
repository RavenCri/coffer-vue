package Management.CoffeeShop.service.ex;
/**
 * 会员数据未找到异常
 * @author nbtarena
 *
 */
public class VipNotFoundException extends ServiceException {

	private static final long serialVersionUID = -6552360950966512090L;

	public VipNotFoundException() {
	}

	public VipNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public VipNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public VipNotFoundException(String message) {
		super(message);
	}

	public VipNotFoundException(Throwable cause) {
		super(cause);
	}

}
