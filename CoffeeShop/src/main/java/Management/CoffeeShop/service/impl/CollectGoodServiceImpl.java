package Management.CoffeeShop.service.impl;

import Management.CoffeeShop.entity.CollectGood;
import Management.CoffeeShop.mapper.CollGoodMapper;
import Management.CoffeeShop.service.CollectGoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CollectGoodServiceImpl implements CollectGoodService {
    @Autowired
    CollGoodMapper collGoodMapper;
    @Override
    public void addCollectGood(CollectGood collectGood) {
        collGoodMapper.addCollectGood(collectGood);
    }

    @Override
    public List<CollectGood> getCollectGoodByVipId(String vip_id) {
        return collGoodMapper.getCollectGoodByVipId(vip_id);
    }
}
