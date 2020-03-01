package Management.CoffeeShop.entity;

public class RechargeOrder {
    private int id;
    private String vid;
    private double recharge_money;
    private int order_status;
    private String time;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public double getRecharge_money() {
        return recharge_money;
    }

    public void setRecharge_money(double recharge_money) {
        this.recharge_money = recharge_money;
    }

    public int getOrder_status() {
        return order_status;
    }

    @Override
    public String toString() {
        return "RechargeOrder{" +
                "id=" + id +
                ", vid='" + vid + '\'' +
                ", rechargeMoney=" + recharge_money +
                ", orderStatus=" + order_status +
                '}';
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public RechargeOrder() {

    }


}
