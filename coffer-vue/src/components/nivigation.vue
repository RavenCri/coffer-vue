<template>
  <div class="container">
    <nav>
      <ul class="mcd-menu">
       
        <li  v-for="(item, index) in commodity" :key="index"> 
          <a href=""> <i class="fa fa-comments-o"></i> <strong>{{item.type}}</strong> <small>科睿Coffer</small>
          </a>
          <ul>
            <li  v-for="(item2, index2) in item.goods" :key="index2"> 
              <a href="#"><i class="fa fa-group"></i>{{item2.smallColumn}}</a>
              <ul>
                <li v-for="(item3, index3) in item2.goods" :key="index3"> 
                  <a :href="'#'+item3.name" @click="clickItem(item3.name)"><i class="fa fa-male"></i>{{item3.name}}</a>
                  <!-- <ul>
                    <li><a href="#"><i class="fa fa-leaf"></i>About</a></li>
                    <li><a href="#"><i class="fa fa-tasks"></i>Skills</a></li>
                  </ul> -->
                </li>
               
              </ul>
            </li>
            
          </ul>
        </li>
       
        <!-- <li class="float"> <a class="search">
            <input type="text" value="search ...">
            <button><i class="fa fa-search"></i></button>
          </a> <a href="" class="search-mobile"> <i class="fa fa-search"></i> </a> </li> -->
      </ul>
    </nav>
  </div>
</template>

<script>
  export default {
    mounted() {
      this.$axios.get("/goods/goods").then(res => {
        // console.log(res.data)
        this.commodity = res.data;
      }).catch(function (error) {
        console.log(error);
      });
      
    },
    data() {
   
      return {
        commodity: null
      }
    },
    methods: {
      clickItem(name){
        document.getElementById(name).nextSibling.nextElementSibling.classList.add("move");
        setTimeout(() => {
          document.getElementById(name).nextSibling.nextElementSibling.classList.remove("move");
        }, 800);
      }
    }

  }
</script>

<style scoped>

 
  body {
    background: #eee;
    overflow-x: hidden;
  }

  .clearfix:before,
  .clearfix:after {
    content: " ";
    display: table;
  }

  .clearfix:after {
    clear: both;
  }

  .clearfix {
    *zoom: 1;
  }

  .container {
    position: relative;
    margin: 0 auto;
    padding: 5px 0;
    clear: both;
  }

  @media only screen and (min-width: 1200px) {
    .container {
      width: 1210px;
    }
  }

  @media only screen and (min-width: 960px) and (max-width: 1199px) {
    .container {
      width: 1030px;
    }
  }

  @media only screen and (min-width: 768px) and (max-width: 959px) {
    .container {
      width: 682px;
    }
  }

  @media only screen and (min-width: 480px) and (max-width: 767px) {
    .container {
      width: 428px;
      margin: 0 auto;
    }
  }

  @media only screen and (max-width: 479px) {
    .container {
      width: 320px;
      margin: 0 auto;
    }
  }

  .mcd-menu {
    list-style: none;
    padding: 0;
    margin: 0;
    background: #fff;
    border-radius: 2px;
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    width: 250px;
  }

  .mcd-menu li {
    position: relative;
  }

  .mcd-menu li a {
    display: block;
    text-decoration: none;
    padding: 12px 20px;
    color: #777;
    text-align: left;
    height: 36px;
    position: relative;
    border-bottom: 1px solid #eee;
  }

  .mcd-menu li a i {
    float: left;
    font-size: 20px;
    margin: 0 10px 0 0;
  }

  .mcd-menu li a p {
    float: left;
    margin: 0;
  }

  .mcd-menu li a strong {
    display: block;
    text-transform: uppercase;
  }

  .mcd-menu li a small {
    display: block;
    font-size: 10px;
  }

  .mcd-menu li a i,
  .mcd-menu li a strong,
  .mcd-menu li a small {
    position: relative;
    transition: all 300ms linear;
    -o-transition: all 300ms linear;
    -ms-transition: all 300ms linear;
    -moz-transition: all 300ms linear;
    -webkit-transition: all 300ms linear;
  }

  .mcd-menu li:hover>a i {
    opacity: 1;
    -webkit-animation: moveFromTop 300ms ease-in-out;
    -moz-animation: moveFromTop 300ms ease-in-out;
    -ms-animation: moveFromTop 300ms ease-in-out;
    -o-animation: moveFromTop 300ms ease-in-out;
    animation: moveFromTop 300ms ease-in-out;
  }

  .mcd-menu li:hover a strong {
    opacity: 1;
    -webkit-animation: moveFromLeft 300ms ease-in-out;
    -moz-animation: moveFromLeft 300ms ease-in-out;
    -ms-animation: moveFromLeft 300ms ease-in-out;
    -o-animation: moveFromLeft 300ms ease-in-out;
    animation: moveFromLeft 300ms ease-in-out;
  }

  .mcd-menu li:hover a small {
    opacity: 1;
    -webkit-animation: moveFromRight 300ms ease-in-out;
    -moz-animation: moveFromRight 300ms ease-in-out;
    -ms-animation: moveFromRight 300ms ease-in-out;
    -o-animation: moveFromRight 300ms ease-in-out;
    animation: moveFromRight 300ms ease-in-out;
  }

  .mcd-menu li:hover>a {
    color: #e67e22;
  }

  .mcd-menu li a.active {
    position: relative;
    color: #e67e22;
    border: 0;
    box-shadow: 0 0 5px #ddd;
    -moz-box-shadow: 0 0 5px #ddd;
    -webkit-box-shadow: 0 0 5px #ddd;
    border-left: 4px solid #e67e22;
    border-right: 4px solid #e67e22;
    margin: 0 -4px;
  }

  .mcd-menu li a.active:before {
    content: "";
    position: absolute;
    top: 42%;
    left: 0;
    border-left: 5px solid #e67e22;
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
  }

  .mcd-menu li a.active:after {
    content: "";
    position: absolute;
    top: 42%;
    right: 0;
    border-right: 5px solid #e67e22;
    border-top: 5px solid transparent;
    border-bottom: 5px solid transparent;
  }

  @-webkit-keyframes moveFromTop {
    from {
      opacity: 0;
      -webkit-transform: translateY(200%);
      -moz-transform: translateY(200%);
      -ms-transform: translateY(200%);
      -o-transform: translateY(200%);
      transform: translateY(200%);
    }

    to {
      opacity: 1;
      -webkit-transform: translateY(0%);
      -moz-transform: translateY(0%);
      -ms-transform: translateY(0%);
      -o-transform: translateY(0%);
      transform: translateY(0%);
    }
  }

  @-webkit-keyframes moveFromLeft {
    from {
      opacity: 0;
      -webkit-transform: translateX(200%);
      -moz-transform: translateX(200%);
      -ms-transform: translateX(200%);
      -o-transform: translateX(200%);
      transform: translateX(200%);
    }

    to {
      opacity: 1;
      -webkit-transform: translateX(0%);
      -moz-transform: translateX(0%);
      -ms-transform: translateX(0%);
      -o-transform: translateX(0%);
      transform: translateX(0%);
    }
  }

  @-webkit-keyframes moveFromRight {
    from {
      opacity: 0;
      -webkit-transform: translateX(-200%);
      -moz-transform: translateX(-200%);
      -ms-transform: translateX(-200%);
      -o-transform: translateX(-200%);
      transform: translateX(-200%);
    }

    to {
      opacity: 1;
      -webkit-transform: translateX(0%);
      -moz-transform: translateX(0%);
      -ms-transform: translateX(0%);
      -o-transform: translateX(0%);
      transform: translateX(0%);
    }
  }

  .mcd-menu li ul,
  .mcd-menu li ul li ul {
    position: absolute;
    height: auto;
    min-width: 200px;
    padding: 0;
    margin: 0;
    background: #fff;
    opacity: 0;
    visibility: hidden;
    transition: all 300ms linear;
    -o-transition: all 300ms linear;
    -ms-transition: all 300ms linear;
    -moz-transition: all 300ms linear;
    -webkit-transition: all 300ms linear;
    z-index: 1000;
    left: 280px;
    top: 0;
    border-left: 4px solid #e67e22;
  }

  .mcd-menu li ul:before {
    content: "";
    position: absolute;
    top: 25px;
    left: -9px;
    border-right: 5px solid #e67e22;
    border-bottom: 5px solid transparent;
    border-top: 5px solid transparent;
  }

  .mcd-menu li:hover>ul,
  .mcd-menu li ul li:hover>ul {
    display: block;
    opacity: 1;
    visibility: visible;
    left: 250px;
  }

  .mcd-menu li ul li a {
    padding: 10px;
    text-align: left;
    border: 0;
    border-bottom: 1px solid #eee;
    height: auto;
  }

  .mcd-menu li ul li a i {
    font-size: 16px;
    display: inline-block;
    margin: 0 10px 0 0;
  }

  .mcd-menu li ul li ul {
    left: 230px;
    top: 0;
    border: 0;
    border-left: 4px solid #e67e22;
  }

  .mcd-menu li ul li ul:before {
    content: "";
    position: absolute;
    top: 15px;
    left: -9px;
    border-right: 5px solid #e67e22;
    border-bottom: 5px solid transparent;
    border-top: 5px solid transparent;
  }

  .mcd-menu li ul li:hover>ul {
    top: 0;
    left: 200px;
  }

  .mcd-menu li a.search {
    padding: 10px 10px 15px;
    clear: both;
  }

  .mcd-menu li a.search i {
    margin: 0;
    display: inline-block;
    font-size: 18px;
  }

  .mcd-menu li a.search input {
    border: 1px solid #eee;
    padding: 10px;
    background: #fff;
    outline: none;
    color: #777;
    width: 170px;
    float: left;
  }

  .mcd-menu li a.search button {
    border: 1px solid #e67e22;
    background: #e67e22;
    outline: none;
    color: #fff;
    margin-left: -4px;
    float: left;
    padding: 10px 10px 11px;
  }

  .mcd-menu li a.search input:focus {
    border: 1px solid #e67e22;
  }

  .search-mobile {
    display: none !important;
    background: #e67e22;
    border-left: 1px solid #e67e22;
    border-radius: 0 3px 3px 0;
  }

  .search-mobile i {
    color: #fff;
    margin: 0 !important;
  }

  @media only screen and (min-width: 960px) and (max-width: 1199px) {
    .mcd-menu {
      margin-left: 10px;
    }
  }

  @media only screen and (min-width: 768px) and (max-width: 959px) {
    .mcd-menu {
      width: 200px;
    }

    .mcd-menu li a {
      height: 30px;
    }

    .mcd-menu li a i {
      font-size: 22px;
    }

    .mcd-menu li a strong {
      font-size: 12px;
    }

    .mcd-menu li a small {
      font-size: 10px;
    }

    .mcd-menu li a.search input {
      width: 120px;
      font-size: 12px;
    }

    .mcd-menu li a.search buton {
      padding: 8px 10px 9px;
    }

    .mcd-menu li>ul {
      min-width: 180px;
    }

    .mcd-menu li:hover>ul {
      min-width: 180px;
      left: 200px;
    }

    .mcd-menu li ul li>ul,
    .mcd-menu li ul li ul li>ul {
      min-width: 150px;
    }

    .mcd-menu li ul li:hover>ul {
      left: 180px;
      min-width: 150px;
    }

    .mcd-menu li ul li ul li:hover>ul {
      left: 150px;
      min-width: 150px;
    }

    .mcd-menu li ul a {
      font-size: 12px;
    }

    .mcd-menu li ul a i {
      font-size: 14px;
    }
  }

  @media only screen and (min-width: 480px) and (max-width: 767px) {
    .mcd-menu {
      width: 50px;
    }

    .mcd-menu li a {
      position: relative;
      padding: 12px 16px;
      height: 20px;
    }

    .mcd-menu li a small {
      display: none;
    }

    .mcd-menu li a strong {
      display: none;
    }

    .mcd-menu li a:hover strong,
    .mcd-menu li a.active strong {
      display: block;
      font-size: 10px;
      padding: 3px 0;
      position: absolute;
      bottom: 0;
      left: 0;
      background: #e67e22;
      color: #fff;
      min-width: 100%;
      text-transform: lowercase;
      font-weight: 400;
      text-align: center;
    }

    .mcd-menu li .search {
      display: none;
    }

    .mcd-menu li>ul {
      min-width: 180px;
      left: 70px;
    }

    .mcd-menu li:hover>ul {
      min-width: 180px;
      left: 50px;
    }

    .mcd-menu li ul li>ul,
    .mcd-menu li ul li ul li>ul {
      min-width: 150px;
    }

    .mcd-menu li ul li:hover>ul {
      left: 180px;
      min-width: 150px;
    }

    .mcd-menu li ul li ul li>ul {
      left: 35px;
      top: 45px;
      border: 0;
      border-top: 4px solid #e67e22;
    }

    .mcd-menu li ul li ul li>ul:before {
      left: 30px;
      top: -9px;
      border: 0;
      border-bottom: 5px solid #e67e22;
      border-left: 5px solid transparent;
      border-right: 5px solid transparent;
    }

    .mcd-menu li ul li ul li:hover>ul {
      left: 30px;
      min-width: 150px;
      top: 35px;
    }

    .mcd-menu li ul a {
      font-size: 12px;
    }

    .mcd-menu li ul a i {
      font-size: 14px;
    }
  }

  @media only screen and (max-width: 479px) {
    .mcd-menu {
      width: 50px;
    }

    .mcd-menu li a {
      position: relative;
      padding: 12px 16px;
      height: 20px;
    }

    .mcd-menu li a small {
      display: none;
    }

    .mcd-menu li a strong {
      display: none;
    }

    .mcd-menu li a:hover strong,
    .mcd-menu li a.active strong {
      display: block;
      font-size: 10px;
      padding: 3px 0;
      position: absolute;
      bottom: 0;
      left: 0;
      background: #e67e22;
      color: #fff;
      min-width: 100%;
      text-transform: lowercase;
      font-weight: 400;
      text-align: center;
    }

    .mcd-menu li .search {
      display: none;
    }

    .mcd-menu li>ul {
      min-width: 180px;
      left: 70px;
    }

    .mcd-menu li:hover>ul {
      min-width: 180px;
      left: 50px;
    }

    .mcd-menu li ul li>ul,
    .mcd-menu li ul li ul li>ul {
      min-width: 150px;
    }

    .mcd-menu li ul li:hover>ul {
      left: 180px;
      min-width: 150px;
    }

    .mcd-menu li ul li ul li>ul {
      left: 35px;
      top: 45px;
      border: 0;
      border-top: 4px solid #e67e22;
    }

    .mcd-menu li ul li ul li>ul:before {
      left: 30px;
      top: -9px;
      border: 0;
      border-bottom: 5px solid #e67e22;
      border-left: 5px solid transparent;
      border-right: 5px solid transparent;
    }

    .mcd-menu li ul li ul li:hover>ul {
      left: 30px;
      min-width: 150px;
      top: 35px;
    }

    .mcd-menu li ul a {
      font-size: 12px;
    }

    .mcd-menu li ul a i {
      font-size: 14px;
    }
  }
</style>