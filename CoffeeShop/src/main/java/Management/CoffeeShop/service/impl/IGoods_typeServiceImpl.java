package Management.CoffeeShop.service.impl;

import Management.CoffeeShop.entity.Goods_type;
import Management.CoffeeShop.mapper.Good_typeMapper;
import Management.CoffeeShop.service.IGoods_typeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IGoods_typeServiceImpl implements IGoods_typeService {
    @Autowired
    Good_typeMapper good_typeMapper;
    @Override
    public Goods_type getGood_typeOfId(int id) {
        return good_typeMapper.getGood_typeOfId(id);
    }
}
