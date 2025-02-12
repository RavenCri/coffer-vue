// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
Vue.config.productionTip = false

import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

import userGlobal from '@/api/userGlobal.js'
import shoppingCar from '@/api/shoppingCar.js'


Vue.prototype.$userGlobal = userGlobal

//配置请求主机 
axios.defaults.baseURL = '/api' 


Vue.prototype.$axios = axios    
Vue.prototype.$shoppingCar = shoppingCar
Vue.use(ElementUI);
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
router.beforeEach((to, from, next) => {
 
  if (to.matched.some(record => record.meta.auth)) {
    console.log(to.fullPath+"需要验证")
  
    if (userGlobal.alreadyLogin()) {
      next()
    } else {
      console.log("进入验证")
    
      //防止无限循环
      if (to.name === 'login') {
        next();
        return
      }
      next({
        path: '/login',
        redirect: to.fullPath
      });
    }
  } else {
    console.log(to.fullPath+"不需要验证")
    next()//若点击的是不需要验证的页面,则进行正常的路由跳转
  }

})