package Management.CoffeeShop.mapper;

import Management.CoffeeShop.entity.RechargeOrder;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.List;

@Mapper
public interface RechargeOrderMapper {
    @Insert("insert into recharge_order(vid,recharge_money,order_status,time) values(#{vid},#{recharge_money},#{order_status},#{time})")
    @Options(useGeneratedKeys=true,keyProperty = "id",keyColumn = "id")
    void addRechargeOrder(RechargeOrder rechargeOrder );

    @Select(value = "select * from recharge_order where id=#{id}")
    @Results(id="order", value={
            @Result(column="id", property="id", id=true),
            @Result(column="vid", property="vid"),
            @Result(column="recharge_money", property="recharge_money", jdbcType = JdbcType.DOUBLE),
            @Result(column="time", property="time"),
            @Result(column="order_status", property="order_status",jdbcType = JdbcType.INTEGER),
    })
    RechargeOrder getRechargrOrderById(int id);
    @Update("update  recharge_order set order_status = #{order_status} where id=#{id}")
    void updateRechargeOrderStatus(RechargeOrder id);
    @Select("select * from recharge_order order by id desc")
    @ResultMap("order")
    List<RechargeOrder> getAllOrder();
}
