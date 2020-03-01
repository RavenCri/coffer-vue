package Management.CoffeeShop.mapper;

import Management.CoffeeShop.entity.RechargeOrder;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface RechargeOrderMapper {
    @Insert("insert (vid,recharge_money,order_status) values(#{vid},#{money},#{order_status})")
    void addRechargeOrder(RechargeOrder rechargeOrder );
    @Select("select * from recharge_order")
    RechargeOrder orderStatusById(int id);
}
