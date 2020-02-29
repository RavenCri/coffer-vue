package Management.CoffeeShop.service.impl;

import Management.CoffeeShop.entity.Column_goods;
import Management.CoffeeShop.entity.Goods_type;
import Management.CoffeeShop.mapper.Column_goodsMapper;
import Management.CoffeeShop.mapper.Good_typeMapper;
import Management.CoffeeShop.service.IColumn_GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class IColumn_GoodsServiceImpl implements IColumn_GoodsService {
    @Autowired
    Column_goodsMapper column_goodsMapper;
    @Autowired
    Good_typeMapper good_typeMapper;
    @Override
    public List<Column_goods> getColumn_goods() {
        List<Column_goods> column_goods = column_goodsMapper.getColumn_goods();
        column_goods.forEach(e->{
            e.setGoods_typeList(good_typeMapper.getGood_typeOfBigColumn(e.getId()));
        });
        return column_goods;

    }
}
