package Management.CoffeeShop.entity;

import java.util.List;

public class Column_goods {
    public int id;
    public String column_type;
    public List<Goods_type> goods_typeList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getColumn_type() {
        return column_type;
    }

    public void setColumn_type(String column_type) {
        this.column_type = column_type;
    }

    public List<Goods_type> getGoods_typeList() {
        return goods_typeList;
    }

    public void setGoods_typeList(List<Goods_type> goods_typeList) {
        this.goods_typeList = goods_typeList;
    }

    @Override
    public String toString() {
        return "Column_goods{" +
                "id=" + id +
                ", column_type='" + column_type + '\'' +
                ", goods_typeList=" + goods_typeList +
                '}';
    }
}

