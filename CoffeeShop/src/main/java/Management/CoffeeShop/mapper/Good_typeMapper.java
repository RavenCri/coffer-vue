package Management.CoffeeShop.mapper;

import Management.CoffeeShop.entity.Goods_type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Good_typeMapper {

    @Select("select * from goods_type where id = #{id}")
    public Goods_type getGood_typeOfId(int id);

    @Select("select * from goods_type where big_column = #{big_column}")
    public List<Goods_type> getGood_typeOfBigColumn(int big_column);
}
