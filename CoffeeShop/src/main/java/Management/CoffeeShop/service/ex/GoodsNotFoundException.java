package Management.CoffeeShop.service.ex;
/**
 * 商品未找到异常
 * @author nbtarena
 *
 */
public class GoodsNotFoundException extends ServiceException {

	private static final long serialVersionUID = -7015642863260956017L;

	public GoodsNotFoundException() {
	}

	public GoodsNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public GoodsNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public GoodsNotFoundException(String message) {
		super(message);
	}

	public GoodsNotFoundException(Throwable cause) {
		super(cause);
	}

}
