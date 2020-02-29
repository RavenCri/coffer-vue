package Management.CoffeeShop.mapper;

import Management.CoffeeShop.entity.Column_goods;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Column_goodsMapper {
    @Select("select * from column_goods")
    public List<Column_goods> getColumn_goods();
}
