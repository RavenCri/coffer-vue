package Management.CoffeeShop.mapper;

import Management.CoffeeShop.entity.CollectGood;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import java.util.List;
@Mapper
public interface CollGoodMapper {
    @Insert({"insert into coll_good(id,vip_id,good_name) values(#{id},#{vip_id},#{good_name})"})
     void addCollectGood(CollectGood collectGood);

    @Results(
            value={
            @Result(column = "id", property = "id", id = true),
            @Result(column = "vip_id", property = "vip_id"),
            @Result(column = "good_name", property = "good_name"),
    })
    @Select("select * from coll_good where vip_id=#{vip_id}")
     List<CollectGood> getCollectGoodByVipId(String vip_id);
}
