package Management.CoffeeShop.entity;

public class RechargeOrder {
    private int id;
    private int vid;
    private double recharge_money;
    private int order_status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
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

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public RechargeOrder() {

    }

    public RechargeOrder(int id, int vid, double recharge_money, int status) {
        this.id = id;
        this.vid = vid;
        this.recharge_money = recharge_money;
        this.order_status = status;
    }

    @Override
    public String toString() {
        return "RechargeOrder{" +
                "id=" + id +
                ", vid=" + vid +
                ", recharge_money=" + recharge_money +
                ", status=" + order_status +
                '}';
    }
}
