<template>
  <div class="content">
    <div class="notice">
      <p>顾客您好,本店饮品如下：</p>
    </div>
    <div v-for="(item, index) in commodity" :key="index">
      <div class="tag">
        <p id="new">{{ item.type }}</p>
        <hr />
        <div class="center">
          <div v-for="(item2, index2) in item.goods" :key="index2">
            <div class="card">
              <span>{{item2.name}}</span></br>
              <span><sup>$</sup>{{item2.price.middleCup}}</span><span>(中杯)</span>
              <img :src="item2.imageUrl" alt="?" />
              <div class="OperationArea">
                <span @click="buyGoods(item2)"><i class="el-icon-shopping-cart-1" aria-hidden="true"></i>购买</span>
                <span>|</span>
                <span @click="addShoppingCar(item2)"><i class="el-icon-shopping-cart-1"
                    aria-hidden="true"></i>购物车</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <goodsWindow ref="goodsWindow" />
  </div>
</template>

<script>
  import goodsWindow from "@/components/goodsWindow"
  export default {
    name: "index",
    methods: {
      buy(goods,buyType) {
       
        this.$refs.goodsWindow.goods.name = goods.name;
        this.$refs.goodsWindow.goods.price = goods.price;
        this.$refs.goodsWindow.goods.imageUrl = goods.imageUrl;
        this.$refs.goodsWindow.goods.buyType = buyType;
        this.$refs.goodsWindow.goods.time = this.dateFormat(new Date());
        this.$refs.goodsWindow.dialogVisible = true;
      },
      addShoppingCar(goods) {
        console.log('加购物车');
        this.buy(goods,'addShoppingCar');
      },
      buyGoods(goods) {
        console.log('买东西');
        this.buy(goods,'buy');

      },
      dateFormat(date) {
        let ret;
        let fmt="YYYY-mm-dd HH:MM";
        const opt = {
          "Y+": date.getFullYear().toString(),        // 年
          "m+": (date.getMonth() + 1).toString(),     // 月
          "d+": date.getDate().toString(),            // 日
          "H+": date.getHours().toString(),           // 时
          "M+": date.getMinutes().toString(),         // 分
          "S+": date.getSeconds().toString()          // 秒
          // 有其他格式化字符需求可以继续添加，必须转化成字符串
        };
        for (let k in opt) {
          ret = new RegExp("(" + k + ")").exec(fmt);
          if (ret) {
            fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
          };
        };
        return fmt;
      }
    },
    components: {
      goodsWindow
    },
    data() {
      return {

        commodity: [
          {
            type: "新品上线",
            goods: [
              {
                name: "水果沙拉",
                imageUrl: require("../assets/images/fml.jpg"),
                price: {
                  middleCup: "6.5",
                  bigCup: "9",
                  bigPlusCup: "15"
                }
              },
              {
                name: "拿铁咖啡",
                imageUrl: require("../assets/images/frust.jpg"),
                price: {
                  middleCup: "10",
                  bigCup: "15",
                  bigPlusCup: "17"
                }
              },
              {
                name: "焦糖玛奇朵",
                imageUrl: require("../assets/images/kwf.jpg"),
                price: {
                  middleCup: "8",
                  bigCup: "12",
                  bigPlusCup: "15"
                }
              }
            ]
          },
          {
            type: "咖啡栏目",
            goods: [
              {
                name: "摩尔咖啡",
                imageUrl: require("../assets/images/nm.jpg"),
                price: {
                  middleCup: "6",
                  bigCup: "8",
                  bigPlusCup: "10"
                }
              },
              {
                name: "卡布奇诺",
                imageUrl: require("../assets/images/yg.jpg"),
                price: {
                  middleCup: "12.5",
                  bigCup: "15.5",
                  bigPlusCup: "20.5"
                }
              }
            ]
          }
        ]
      };
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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
    text-align: center;
    font-size: 20px;
    margin: 40px auto 0px;
    font-size: 25px;
    position: relative;
    top: 20px;
  }

  .center {
    width: 60%;
    margin: 20px auto 30px;
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    position: relative;
  }

  .center .card {
    width: 200px;
    border: 2px solid rgba(255, 255, 244, 0.5);
    padding: 20px;
    margin-top: 30px;
    background: linear-gradient(-45deg, #ffec61, #f321d7);
    border-radius: 15px;
    /* box-shadow:1px 0  10px #000 inset; */
    user-select: none;
    border: 2px solid slateblue;
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
    border-radius: 12px;
  }

  .card div span:nth-child(1):hover,
  .card div span:nth-child(3):hover {
    transform: scale(1.1);
    /* background-color: white;
  color: black; */
    display: inline;
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