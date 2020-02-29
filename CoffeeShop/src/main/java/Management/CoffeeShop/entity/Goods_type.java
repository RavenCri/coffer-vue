package Management.CoffeeShop.entity;

public class Goods_type {
    public  int id;
    public  String small_column;
    public  int big_column;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSmall_column() {
        return small_column;
    }

    public void setSmall_column(String small_column) {
        this.small_column = small_column;
    }

    public int getBig_column() {
        return big_column;
    }

    public void setBig_column(int big_column) {
        this.big_column = big_column;
    }

    @Override
    public String toString() {
        return "Goods_type{" +
                "id=" + id +
                ", small_column='" + small_column + '\'' +
                ", big_column=" + big_column +
                '}';
    }
}
