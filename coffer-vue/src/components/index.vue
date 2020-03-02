<template>
  <div class="content">
    <div class="notice">
      <p>顾客您好,本店饮品如下：</p>
    </div>
    <div style="margin-top: 60px;">



      <div style="width: 90%; margin: 0 auto; position: relative;top: 5px;">
        <p
          style="padding: 5px 20px;margin-left: 43%; background-color: black;color: blanchedalmond;font-size: 25px;text-align: center;width: 100px;">
          <span>新品上线</span></p>
        <hr>
        <el-carousel :interval="2000" type="card" style="margin-top: 20px;" height="500px" width="600px">
          <el-carousel-item v-for="item in newGoods" :key="item.name">
            <div @click="clickImageGoods(item.name)"
              :style="{ 'background-image': 'url(' + item.imageUrl + ')','background-repeat':'no-repeat','background-size':'cover','height':'100%' ,'width':'100%'}">
              <!-- <img :src="item.imageUrl"  width=100% height=100% alt="?" /> -->
            </div>
          </el-carousel-item>
        </el-carousel>
      </div>
    </div>
    <div v-for="(item, index) in commodity" :key="index">
      <div class="tag">
        <p :id="item.type"><span
            style="display: inline-block; padding: 5px 20px; background-color:blanchedalmond;color:blueviolet;">{{ item.type }}</span>
        </p>
        <hr />
      </div>
      <div>
        <div v-for="(item2, index2) in item.goods" :key="index2">
          <p :id="item.type" style="width: 150px;  margin: 30px auto 0;font-size:25px"><span
              style="display: inline-block;padding: 5px 20px; background-color: black;color: blanchedalmond; ">{{ item2.smallColumn }}</span>
          </p>
          <hr />
          <div class="center">
            <div v-for="(item3, index3) in item2.goods" :key="index3">
              <span :id="item3.name"></span>
              <div class="card">
                <span>{{item3.name}}</span></br>
                <span><sup>$</sup>{{item3.price.middleCup}}</span><span>(中杯)</span>
                <div>
                  <img :src="item3.imageUrl" style="position: absolute;" alt="?" />
                  <div class="collGoods" style="display: table-cell;"><i class="el-icon-star-off"
                      @click="collGood(item3)" style="font-size: 50px;"></i></div>
                </div>
                <div class="OperationArea">
                  <span @click="buyGoods(item3)"><i class="el-icon-shopping-cart-1" aria-hidden="true"></i>购买</span>
                  <span>|</span>
                  <span @click="addShoppingCar(item3)"><i class="el-icon-shopping-cart-1"
                      aria-hidden="true"></i>购物车</span>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

    </div>
    <goodsWindow ref="goodsWindow" />
    <div style="position: fixed;left: 10px;top: 200px;z-index: 5;">
      <div class="navg">导航</div>
      <div class="na">
        <nivigation ref="nivigation" />
      </div>
    </div>
  </div>
</template>

<script>
  import goodsWindow from "@/components/goodsWindow"
  import nivigation from "@/components/nivigation"
  export default {
    name: "index",
    mounted() {
      this.$axios.get("/goods/newGoods").then(res => {
        // console.log(res.data)
        this.newGoods = res.data;
      }).catch(function (error) {
        console.log(error);
      });
      this.$axios.get("/goods/goods").then(res => {
        // console.log(res.data)
        this.commodity = res.data;
      }).catch(function (error) {
        console.log(error);
      });
      if (JSON.stringify(this.$route.query) != '{}') {


        let name = this.$route.query.name;
        this.clickImageGoods(name)
      }

      this.flushInfo();
    },
    methods: {

      clickImageGoods(name) {
        let good;
        console.log("点击：" + name)
        this.commodity.forEach(commod => {
          // console.log( commod.goods)
          commod.goods.forEach(e => {

            e.goods.forEach(item => {
              console.log("item:" + item.name)
              if (name == item.name) {
                good = item;
              }
            })
          })
        })
        console.log(good)
        this.buyGoods(good)
      },
      buy(goods, buyType) {

        this.$refs.goodsWindow.goods.name = goods.name;
        this.$refs.goodsWindow.goods.price = goods.price;
        this.$refs.goodsWindow.goods.imageUrl = goods.imageUrl;
        this.$refs.goodsWindow.goods.buyType = buyType;
        this.$refs.goodsWindow.goods.buyNum = 1;
        this.$refs.goodsWindow.goods.time = this.$refs.goodsWindow.dateFormat(new Date());
        this.$refs.goodsWindow.dialogVisible = true;
      },
      addShoppingCar(goods) {
        console.log('加购物车');
        this.buy(goods, 'addShoppingCar');
      },
      buyGoods(goods) {
        console.log('买东西');
        this.buy(goods, 'buy');

      },
      flushInfo() {
        if (this.$userGlobal.alreadyLogin()) {
          var user = this.$userGlobal.getUserInfo();
          this.$axios.post("/vip/login", {
            vipId: user.vipId
          }, { headers: { 'Content-type': 'application/json;charset=UTF-8' } }).then(res => {
            let info = res.data.message;
            this.$userGlobal.setUserInfo(JSON.parse(info));
          })
        }
      },
      collGood(item) {
        console.log(item)
        if (this.$userGlobal.alreadyLogin()) {
          this.$axios.post("/collect/add", {
            vipId: this.$userGlobal.getUserInfo().vipId,
            goodName: item.name
          }, { headers: { 'Content-type': 'application/json;charset=UTF-8' } }).then(res => {
            let status = res.data.status;

            if (status == 'success') {
              this.$message({
                message: "已收藏,可以在个人中心查看哦~",
                type: "success"
              });
            } else if (status == 'alreadyColl') {
              this.$message({
                message: "已经收藏过该商品啦~换个喜欢的商品收藏吧~",
                type: "error"
              });
            }
          })
        } else {
          this.$confirm('你还未登陆，是否需要登录?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.$router.push({ name: 'login', params: { redirect: "/" } });
          }).catch(() => {

          });
        }

      }
    },
    components: {
      goodsWindow, nivigation
    },
    data() {
      return {

        newGoods: [
          {
            imageUrl: require("../assets/images/fml.jpg"),
            name: "水果沙拉"
          },
          {
            imageUrl: require("../assets/images/frust.jpg"),
            name: "拿铁咖啡"
          }, {
            imageUrl: require("../assets/images/kwf.jpg"),
            name: "焦糖玛奇朵"
          },
          {
            imageUrl: require("../assets/images/nm.jpg"),
            name: "摩尔咖啡"
          },
          {
            imageUrl: require("../assets/images/yg.jpg"),
            name: "卡布奇诺"
          }

        ],
        commodity: [{ "goods": [{ "goods": [{ "price": { "middleCup": "10", "bigCup": "15", "bigPlusCup": "18" }, "imageUrl": "http://localhost/getGoodsImg?filename=s4bOnjpd8l", "name": "美式咖啡" }, { "price": { "middleCup": "10", "bigCup": "15", "bigPlusCup": "18" }, "imageUrl": "http://localhost/getGoodsImg?filename=n7vJTAZKZh", "name": "拿铁咖啡" }, { "price": { "middleCup": "9", "bigCup": "15", "bigPlusCup": "23" }, "imageUrl": "http://localhost/getGoodsImg?filename=J0XZrwARwy", "name": "卡布奇诺" }, { "price": { "middleCup": "15", "bigCup": "25", "bigPlusCup": "32" }, "imageUrl": "http://localhost/getGoodsImg?filename=qqROI9x1ov", "name": "爱尔兰咖啡" }, { "price": { "middleCup": "13", "bigCup": "15", "bigPlusCup": "17" }, "imageUrl": "http://localhost/getGoodsImg?filename=kvfdGO1ueJ", "name": "维也纳咖啡" }, { "price": { "middleCup": "16", "bigCup": "22", "bigPlusCup": "26" }, "imageUrl": "http://localhost/getGoodsImg?filename=9ct2eQCy64", "name": "意大利咖啡" }], "smallColumn": "咖啡区" }, { "goods": [{ "price": { "middleCup": "7", "bigCup": "8", "bigPlusCup": "9" }, "imageUrl": "http://localhost/getGoodsImg?filename=moDxGRdeS3", "name": "绿豆果汁" }], "smallColumn": "果汁区" }], "type": "饮品栏目" }, { "goods": [{ "goods": [{ "price": { "middleCup": "6", "bigCup": "10", "bigPlusCup": "13" }, "imageUrl": "http://localhost/getGoodsImg?filename=uMGeGOJROY", "name": "草莓蛋糕" }, { "price": { "middleCup": "14", "bigCup": "20", "bigPlusCup": "25" }, "imageUrl": "http://localhost/getGoodsImg?filename=KbJ3ODpIoN", "name": "果冻草莓甜糕" }, { "price": { "middleCup": "12", "bigCup": "15", "bigPlusCup": "18" }, "imageUrl": "http://localhost/getGoodsImg?filename=OPPDqSMrKK", "name": "冰淇淋松饼" }], "smallColumn": "点心区" }], "type": "糕点栏目" }, { "goods": [{ "goods": [{ "price": { "middleCup": "18", "bigCup": "24", "bigPlusCup": "28" }, "imageUrl": "http://localhost/getGoodsImg?filename=EtotJQyf79", "name": "经典套餐" }, { "price": { "middleCup": "15", "bigCup": "20", "bigPlusCup": "23" }, "imageUrl": "http://localhost/getGoodsImg?filename=GXTsPgT2ow", "name": "超值套餐" }], "smallColumn": "套餐区" }], "type": "套餐栏目" }]


      };
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  .move {


    animation: 0.4s mv linear;
  }

  @keyframes mv {
    from {

      transform: scale(0.9);
    }

    to {

      transform: scale(1.0);
    }
  }

  @keyframes change {
    0% {
      background-color: blueviolet;
    }

    25% {
      background-color: cornflowerblue;
    }

    50% {
      background-color: darkcyan;
    }

    75% {
      background-color: deeppink;
    }

    100% {
      background-color: dodgerblue;
    }
  }

  .na {
    display: none;

  }

  .navg {
    width: 60px;
    height: 60px;
    border-radius: 100%;
    background-color: blueviolet;
    font-size: 18px;
    line-height: 60px;
    text-align: center;
    z-index: 8;
    animation: 2s change linear infinite;
    color: floralwhite;
  }

  .navg:hover {
    transform: scale(1.2);

  }

  .navg:hover+.na,
  .na:hover {

    display: block;



  }

  .el-carousel__item h3 {
    color: #475669;
    font-size: 14px;
    opacity: 0.75;
    line-height: 200px;
    margin: 0;
  }

  .el-carousel__item:nth-child(2n) {
    background-color: #99a9bf;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: #d3dce6;
  }

  .content {
    width: 80%;
    margin: 0 auto;
  }

  .notice {
    width: 60%;
    margin: 0 auto;
    text-align: center;
    font-size: 20px;
    animation: noticeMove 5s linear infinite alternate;
    position: relative;
    top: 30px;
  }

  .tag {
    text-align: left;
    font-size: 20px;
    margin: 40px auto 0px;
    font-size: 25px;
    position: relative;
    top: 20px;
  }

  .center {
    width: 100%;
    margin: 20px auto 30px;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    position: relative;
  }

  .center .card {
    text-align: center;
    width: 200px;
    border: 2px solid rgba(255, 255, 244, 0.5);
    padding: 20px;
    margin-top: 30px;
    background: linear-gradient(-45deg, #ffec61, #f321d7);
    border-radius: 20px;
    /* box-shadow:1px 0  10px #000 inset; */
    user-select: none;
    /* border: 1px solid slateblue; */
  }

  .center .card:hover {
    /* transform: scale(1.1); */
    z-index: 2;
  }

  .center .card img {
    width: 200px;
    height: 300px;

  }

  .card :nth-child(1) {
    font-size: 18px;
  }

  .card :nth-child(2) {
    font-size: 15px;
  }

  .card :nth-child(4) {
    font-size: 5px;
  }

  .card div {
    display: flex;
    justify-content: space-around;
    font-size: 20px;
    margin-top: 20px;


  }

  .card div span {
    padding: 10px;
    color: black;


  }

  .card div span:nth-child(1),
  .card div span:nth-child(3) {
    background-color: black;
    color: white;
    cursor: pointer;
    border-radius: 15%;
  }

  .card div span:nth-child(1):hover,
  .card div span:nth-child(3):hover {
    transform: scale(1.1);
    /* background-color: white;
  color: black; */
    display: inline;
  }

  .card div:nth-child(2) {
    width: 200px;
    height: 301px;

  }

  .collGoods {
    background-color: rgba(255, 255, 244, 0.5);
    line-height: 280px;
    text-align: center;
    top: -20px;
    position: relative;
    opacity: 0;

  }

  .collGoods:hover {
    opacity: 0.8;
  }

  .card div span {
    font-size: 15px;
  }

  .card div span>i {
    font-size: 25px;
  }





  @keyframes noticeMove {
    from {
      left: 100px;
    }

    to {
      left: -100px;
    }
  }
</style>