<template>
  <div class="content">
    <div class="title"><i class="el-icon-ice-cream"></i>结算台</div>
    <div>
      <el-table :data="shoppingCar" style="width: 100%">
        <el-table-column label="下单时间" width="180">
          <template slot-scope="scope">
            <i class="el-icon-time"></i>
            <span style="margin-left: 10px">{{ scope.row.time }}</span>
          </template>
        </el-table-column>
        <el-table-column label="商品名" width="180">
          <template slot-scope="scope">
            <el-popover trigger="hover" placement="top">
              <p>商品名: {{ scope.row.name }}</p>
              <p>单价: {{ scope.row.price[scope.row.cupType] }} 元</p>
              <div slot="reference" class="name-wrapper">
                <img :src="scope.row.imageUrl" alt="" width="50px" height="50px"
                  style="display: block;margin-bottom: 5px;position: relative;left: 10px;border-radius: 100%;" />
                <el-tag size="medium">{{ scope.row.name }}</el-tag>
              </div>
            </el-popover>
          </template>
        </el-table-column>
        <el-table-column label="商品规格" width="180">
          <template slot-scope="scope">
            <el-tag size="medium">{{
              sweetNessChinese[scope.row.sweetNess]
            }}</el-tag>
            <el-tag size="medium">{{
              cuyTypeChinese[scope.row.cupType]
            }}</el-tag>

          </template>
        </el-table-column>
        <el-table-column label="数量" width="180">
          <template slot-scope="scope">
            <div class="num">
              <i class="el-icon-circle-plus" @click="add(scope.$index)"></i>
              <span style="width:30px;display:inline-block;text-align:center">
                {{ scope.row.buyNum }}
              </span>
              <i class="el-icon-remove" @click="dec(scope.$index)"></i> 杯
            </div>
            <!-- (scope.row.buyNum*scope.row.price[scope.row.cupType]).toFixed(2)  -->
            <el-tag size="medium">小计：{{
                (scope.row.buyNum * scope.row.price[scope.row.cupType]).toFixed(
                  2
                )
              }}
              元</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
            <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <hr style="margin-top: 50px;" />
    <div class="totalMoney">
      <span style="display: block;" :class="{textline:logined}">合计：{{totalMoney}}元</span>
      <span style="display: block;" v-if="logined">会员优惠价格：{{vipMoney}}元</span>
      <div>
        <el-button type="primary" round @click="countMoney">结算金额</el-button>
      </div>
    </div>
    <goodsWindow ref="goodsWindow" />
  </div>
</template>

<script>
  import goodsWindow from "@/components/goodsWindow";
  export default {
    mounted() {
      this.init();
    },
    data() {
      return {
        totalMoney: 0,
        vipMoney: 0,
        shoppingCar: null,
        currentClickIndex: null,
        logined: false,
        cuyTypeChinese: {
          middleCup: "中杯",
          bigCup: "大杯",
          bigPlusCup: "超大杯"
        },
        sweetNessChinese: {
          littleSweet: "少糖",
          middleSweet: "中糖",
          manySweet: "多糖"
        }
      };
    },
    methods: {
      init() {
        this.shoppingCar = this.$shoppingCar.getShoppringCar();
        if (this.shoppingCar == '{}') {
          this.shoppingCar = new Array();
        }
        this.calculationMoney();
        this.logined = this.$userGlobal.alreadyLogin();
        console.log("登陆状态：" + this.logined)
      },
      calculationMoney() {
        this.totalMoney = this.vipMoney = 0;

        if (this.shoppingCar != '{}') {
          this.shoppingCar.forEach((e) => {
            this.totalMoney += (e.buyNum * e.price[e.cupType])
          });
          this.vipMoney = (this.totalMoney * 0.95).toFixed(2);
          
        }

      },
      handleEdit(index, row) {
        console.log(index, row);
        this.shoppingCar.forEach(e => {
          if (
            e.name == row.name &&
            e.cupType == row.cupType &&
            e.sweetNess == row.sweetNess
          ) {
            this.$refs.goodsWindow.goods.name = e.name;
            this.$refs.goodsWindow.goods.price = e.price;
            this.$refs.goodsWindow.goods.imageUrl = e.imageUrl;
            this.$refs.goodsWindow.goods.buyNum = e.buyNum;
            this.$refs.goodsWindow.goods.sweetNess = e.sweetNess;
            this.$refs.goodsWindow.goods.cupType = e.cupType;
            this.$refs.goodsWindow.goods.buyType = "updataGoodsInfo";
            // 当前修改的商品下标
            this.currentClickIndex = index;
            this.calculationMoney();
            this.$refs.goodsWindow.dialogVisible = true;
          }
        });
      },
      handleDelete(index, row) {
        console.log(index, row);
        // splice 会改变原数组 ，而 slice不会 ，
        /*
          slice只会返回要截取的数组 （1，2）等价于 [1,2)
          splice返回被删除的项目
        */
        this.$confirm('此操作将从购物车移除商品{'+row.name+'}, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.shoppingCar.splice(index, 1);
          this.setShoppringCar();
          this.calculationMoney();
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
        }).catch(() => {

        });

      },
      add(index) {
        this.shoppingCar[index].buyNum += 1;
        this.setShoppringCar();
        this.calculationMoney();
      },

      dec(index) {
        if (this.shoppingCar[index].buyNum >= 2) {
          this.shoppingCar[index].buyNum -= 1;
          this.setShoppringCar();
        } else {
          this.$message({
            message: "不可以再减少了哦",
            type: "warning"
          });
        }
        this.calculationMoney();
      },
      setShoppringCar() {
        this.$shoppingCar.setShoppringCar(this.shoppingCar);
      },
      countMoney() {
        if(this.shoppingCar.length == 0){
          this.$message.error('购物车目前为空哦~');
          return;
        }
        if (this.logined) {
          this.$message({
            message: "您共需要支付" + this.vipMoney + "元",
            type: "warning"
          });
        } else {
          this.$confirm('登陆可享会员优惠95折，是否需要登录?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            this.$router.push({ name: 'login', params: { redirect: "/shoppingCar" } });
          }).catch(() => {
            this.$message({
              message: "您共需要支付" + this.totalMoney + "元",
              type: "warning"
            });
          });

        }
      }
    },
    components: {
      goodsWindow
    }
  };
</script>

<style scoped>
  .title {
    text-align: center;
    margin: 10px auto 20px;
    font-size: 25px;
  }

  .title>i {
    font-size: 60px;
  }

  .content {
    width: 60%;
    margin: 0 auto;
  }

  .num {
    font-size: 20px;
    user-select: none;
  }

  .num i:nth-child(1):hover,
  .num i:nth-child(3):hover {
    color: blueviolet;
  }

  .totalMoney {
    position: relative;
    text-align: center;
  }

  .totalMoney span:nth-child(1) {
    position: relative;
    top: 20px;

    color: aquamarine;
  }

  .totalMoney span:nth-child(2) {
    position: relative;
    top: 30px;
    color: blueviolet;
  }


  /* 父元素下 第二个子元素的 每个div */
  .totalMoney div:nth-child(2),
  .totalMoney div:nth-child(3) {

    position: relative;
    top: 50px;
  }
 
  .totalMoney::after {
    content: "";
    display: block;
    height: 30px;
  }

  .textline {
    text-decoration: line-through;
  }
</style>