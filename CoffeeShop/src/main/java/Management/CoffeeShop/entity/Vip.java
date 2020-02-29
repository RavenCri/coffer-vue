package Management.CoffeeShop.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 会员类
 * @author nbtarena
 *
 */
public class Vip extends BaseEntity implements Serializable{ 

	private static final long serialVersionUID = 2545741057625614942L;
	
	private Integer vid; //编号
	private String vname; //用户名
	private String vphone; //手机号
	private double vmoney; //余额
	private int credit; //会员积分
	private int vtype; //会员类型
	private int vdiscount; //会员折扣
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
	private Date regTime; //注册时间
	private Date recentTime; //最近购买时间
	private String vip_id;
    private double cost_money;
	private int exp;
	private int count;

	public double getCost_money() {
		return cost_money;
	}

	public void setCost_money(double cost_money) {
		this.cost_money = cost_money;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getVip_id() {
		return vip_id;
	}

	public void setVip_id(String vip_id) {
		this.vip_id = vip_id;
	}

	public int getVdiscount() {
		return vdiscount;
	}
	public void setVdiscount(int vdiscount) {
		this.vdiscount = vdiscount;
	}
	public int getVtype() {
		return vtype;
	}
	public void setVtype(int vtype) {
		this.vtype = vtype;
	}
	public Integer getVid() {
		return vid;
	}
	public void setVid(Integer vid) {
		this.vid = vid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVphone() {
		return vphone;
	}
	public void setVphone(String vphone) {
		this.vphone = vphone;
	}
	public double getVmoney() {
		return vmoney;
	}
	public void setVmoney(double vmoney) {
		this.vmoney = vmoney;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date date) {
		this.regTime = date;
	}
	public Date getRecentTime() {
		return recentTime;
	}
	public void setRecentTime(Date recentTime) {
		this.recentTime = recentTime;
	}

	@Override
	public String toString() {
		return "Vip{" +
				"vid=" + vid +
				", vname='" + vname + '\'' +
				", vphone='" + vphone + '\'' +
				", vmoney=" + vmoney +
				", credit=" + credit +
				", vtype=" + vtype +
				", vdiscount=" + vdiscount +
				", regTime=" + regTime +
				", recentTime=" + recentTime +
				", vipID=" + vip_id +
				'}';
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((vid == null) ? 0 : vid.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Vip other = (Vip) obj;
		if (vid == null) {
			if (other.vid != null)
				return false;
		} else if (!vid.equals(other.vid))
			return false;
		return true;
	}
	
}
