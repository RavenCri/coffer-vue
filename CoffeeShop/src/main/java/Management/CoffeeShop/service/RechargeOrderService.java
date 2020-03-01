package Management.CoffeeShop.service;

import Management.CoffeeShop.entity.RechargeOrder;

import java.util.List;


public interface RechargeOrderService {
    void addRechargeOrder(RechargeOrder rechargeOrder );
    RechargeOrder getRechargrOrderById(int id);
    void updateRechargeOrderStatus(RechargeOrder id);
    List<RechargeOrder> getAllOrder() ;
}
