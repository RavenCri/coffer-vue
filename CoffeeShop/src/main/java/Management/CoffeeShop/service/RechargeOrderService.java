package Management.CoffeeShop.service;

import Management.CoffeeShop.entity.RechargeOrder;


public interface RechargeOrderService {
    void addRechargeOrder(RechargeOrder rechargeOrder );
    RechargeOrder orderStatusById(int id);
}
