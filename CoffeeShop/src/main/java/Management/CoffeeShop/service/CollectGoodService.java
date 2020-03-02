package Management.CoffeeShop.service;

import Management.CoffeeShop.entity.CollectGood;
import org.springframework.stereotype.Service;

import java.util.List;

public interface CollectGoodService {
    public void addCollectGood(CollectGood collectGood);
    public List<CollectGood> getCollectGoodByVipId(String vip_id);
}
