package Management.CoffeeShop.service.ex;

import Management.CoffeeShop.entity.RechargeOrder;
import Management.CoffeeShop.mapper.RechargeOrderMapper;
import Management.CoffeeShop.service.RechargeOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RechargeOrderServiceImpl implements RechargeOrderService {
    @Autowired
    RechargeOrderMapper rechargeOrderMapper;
    @Override
    public void addRechargeOrder(RechargeOrder rechargeOrder ) {
            rechargeOrderMapper.addRechargeOrder(rechargeOrder);
    }

    @Override
    public RechargeOrder getRechargrOrderById(int id) {
        return rechargeOrderMapper.getRechargrOrderById(id);
    }
    public void updateRechargeOrderStatus(RechargeOrder rechargeOrder){
        rechargeOrderMapper.updateRechargeOrderStatus(rechargeOrder);
    }

    public List<RechargeOrder> getAllOrder() {
       return rechargeOrderMapper.getAllOrder();
    }
}
