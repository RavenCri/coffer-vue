package Management.CoffeeShop.entity;

import java.io.Serializable;

/**
 * 订单类
 * @author nbtarena
 *
 */
public class GoodOrder extends BaseEntity implements Serializable{

	private static final long serialVersionUID = -3793411030926201733L;
	
	private int bid; //序号
	private String vid; //会员id
	private int good_num;
	private double money; //总价格
	private double fmoney; //最后支付价格
	private String created_time;
	private Goods good;
	private String commodity_specification;

	public GoodOrder() {
	}

	public GoodOrder(int bid, String vid, int good_num, double money, double fmoney, String created_time, Goods good, String commodity_specification) {
		this.bid = bid;
		this.vid = vid;
		this.good_num = good_num;
		this.money = money;
		this.fmoney = fmoney;
		this.created_time = created_time;
		this.good = good;
		this.commodity_specification = commodity_specification;
	}

	@Override
	public String toString() {
		return "GoodOrder{" +
				"bid=" + bid +
				", vid=" + vid +
				", good=" + good +
				", good_num=" + good_num +
				", commodity_specification='" + commodity_specification + '\'' +
				", money=" + money +
				", fmoney=" + fmoney +
				", created_time='" + created_time + '\'' +
				'}';
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getVid() {
		return vid;
	}

	public void setVid(String vid) {
		this.vid = vid;
	}

	public Goods getGood() {
		return good;
	}

	public void setGood(Goods good) {
		this.good = good;
	}

	public int getGood_num() {
		return good_num;
	}

	public void setGood_num(int good_num) {
		this.good_num = good_num;
	}

	public String getCommodity_specification() {
		return commodity_specification;
	}

	public void setCommodity_specification(String commodity_specification) {
		this.commodity_specification = commodity_specification;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public double getFmoney() {
		return fmoney;
	}

	public void setFmoney(double fmoney) {
		this.fmoney = fmoney;
	}

	public String getCreated_time() {
		return created_time;
	}

	public void setCreated_time(String created_time) {
		this.created_time = created_time;
	}
}