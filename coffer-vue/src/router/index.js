import Vue from 'vue'
import Router from 'vue-router'
import index from '@/components/index'
import personCenter from '@/components/personCenter'
import login from '@/components/login'
import userInfo from '@/components/userInfo'
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
        }
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
    }
  ]
})
