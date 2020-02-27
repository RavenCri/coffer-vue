import Vue from 'vue'
import Router from 'vue-router'
import index from '@/components/index'
import personCenter from '@/components/usercenter/personCenter'
import login from '@/components/login'
import exchargeGood from '@/components/exchargeGood'
import userInfo from '@/components/usercenter/userInfo'
import updateInfo from '@/components/usercenter/updateInfo'
import userBill from '@/components/usercenter/userBill'
import shoppingCar from '@/components/shoppingCar'
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: index
    },
    {
      path: '/personCenter',
      name: 'personCenter',
      meta: {
        auth: true
      },
      component: personCenter,
      children: [
        {
          path: 'userInfo',
          component: userInfo
        },
        {
          path: 'userBill',
          component: userBill
        },
        {
          path: 'updateInfo',
          component: updateInfo
        },
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: login
    },
    {
      path: '/shoppingCar',
      name: 'shoppingCar',
      component: shoppingCar
    },
    {
      path: '/exchargeGood',
      name: 'exchargeGood',
      component: exchargeGood
    }
  ]
})
