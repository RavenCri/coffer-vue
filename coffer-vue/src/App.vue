<template>
  <div>
    <div class="header" router>
      <div>
        <img src="./assets/images/logo.png" alt="图片">
      </div>

      <ul id='navigationOut'>

        <li>
          <a href="/">饮品专区</a>
          <!-- <ul class="navigationIn">
            <li><a href="#hot">美式咖啡</a></li>
            <li><a href="#hot">卡布奇诺</a></li>
            <li><a href="#hot">摩卡咖啡</a></li>
          </ul> -->
        </li>
        <li>
          <a href="#糕点专区">糕点专区</a>
          <!-- <ul class="navigationIn">
            <li><a href="#hot">甜品</a></li>
            <li><a href="#hot">培根</a></li>
            <li><a href="#hot">坚果</a></li>
          </ul> -->

        </li>
        <li>
          <a href="#套餐专区">套餐专区</a>
          <!-- <ul class="navigationIn">
            <li><a href="#hot">松饼+饮料</a></li>
            <li><a href="#hot">冰美式&蓝莓</a></li>

          </ul> -->
        </li>
        <li>
          <a href="#">消耗品</a>
          <ul class="navigationIn">
            <li><a href="#hot">马克杯</a></li>
            <li><a href="#hot">保温杯</a></li>
            <li><a href="#hot">随行杯</a></li>
            <li><a href="#hot">吸管杯</a></li>
          </ul>
        </li>
        <li>
          
          <router-link to="shoppingCar">购物车</router-link>
        </li>
        <li>
          
          <router-link to="personCenter">个人中心</router-link>
        </li>
      </ul>
    </div>

    <router-view />

    <div class="foot">
      @raven设计
    </div>
  </div>
</template>

<script>
  export default {
    name: 'App'
  }
</script>

<style>
  * {
    padding: 0px;
    margin: 0px;

  }


  /* head部分的布局设置 */
  .header {
    position: relative;
    width: 100%;
    left: 0;
    right: 0;
    margin: 0 auto;
    background: linear-gradient(-45deg, #f403d1, #65b5f6);
  }

  /* 整体设置一级菜单的布局 */
  .header>ul {
    width: 100%;
    list-style: none;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    text-align: center;
    font-weight: bold;
    border-top: 0;
    position: relative;
    background: linear-gradient(-45deg, #f403d1, #65b5f6);

  }

  /* 设置一级菜单的每项 */
  .header>ul>li {
    width: 120px;
    margin-right: 10px;
    margin-left: 30px;
    margin-top: 20px;
    line-height: 60px;

  }

  /* 一级菜单 */
  .header>ul>li>a {
    text-decoration: none;
    font-size: 18px;
    width: 100%;
    display: block;

    color: #fff;
  }

  /* 当鼠标移向一级菜单 */
  .header>ul>li>a:hover {
    background-color: #fff;
    color: #000;
    transition: 1s;
    transform: scale(1.1);
  }

  .header div {
    display: flex;
    justify-content: center;

  }

  .header img {
    width: 250px;
    margin: 40px 0 20px;

  }

  /* 二级标签默认不显示 */
  .navigationIn {
    display: none;
  }

  /* 二级标签的每个栏目 */
  .navigationIn li a {
    font-size: 15px;
    color: #000;
    /* 可以让 a标签充满整个块 */
    display: block;
    text-decoration: none;

  }

  /* 二级标签的宽度 */
  .navigationIn li {
    width: 120px;
    height: 50px;
    background-color: #ffe;

  }

  /* 如果鼠标指向一级菜单 则让对应的二级菜单出来 */
  .header ul li:hover ul {

    display: block;

  }

  /* 整体设置二级菜单的布局 */
  .header ul ul {
    list-style: none;
    display: none;
    position: absolute;
    z-index: 5;

  }

  /* 当鼠标指向二级菜单时 */
  .navigationIn li:hover {
    background: linear-gradient(-45deg, #ffec61, #f321d7);
    transform: scale(1.1);
  }

  .foot {
    
    text-align: center;
    margin-top: 50px;
    margin-bottom: 20px;
  }
</style>