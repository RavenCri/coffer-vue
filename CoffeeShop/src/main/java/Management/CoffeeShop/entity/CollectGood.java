package Management.CoffeeShop.entity;

public class CollectGood {
    private int id;
    private String vip_id;
    private String good_name;

    public CollectGood() {

    }

    public CollectGood(int id, String vip_id, String good_name) {
        this.id = id;
        this.vip_id = vip_id;
        this.good_name = good_name;
    }

    @Override
    public String toString() {
        return "CollectGood{" +
                "id=" + id +
                ", vip_id='" + vip_id + '\'' +
                ", good_num='" + good_name + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getVip_id() {
        return vip_id;
    }

    public void setVip_id(String vip_id) {
        this.vip_id = vip_id;
    }

    public String getGood_name() {
        return good_name;
    }

    public void setGood_name(String good_name) {
        this.good_name = good_name;
    }
}
