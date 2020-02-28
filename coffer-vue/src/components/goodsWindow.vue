<template>
  <div>
    <el-dialog title="选择商品属性" :visible.sync="dialogVisible" width="35%" :before-close="handleClose"
      :close-on-press-escape=false :close-on-click-modal=false>
      <el-form ref="form" :model="goods" label-width="80px" :rules="rules">
        <img :src="goods.imageUrl" alt="" width="60px" style="position: relative;left: 45%;" />
        <el-form-item label="商品名称">
          {{ goods.name }}
        </el-form-item>
        <el-form-item label="选择甜度" prop="sweetNess">
          <el-select v-model="goods.sweetNess" placeholder="请选择您喜欢的甜度">
            <el-option label="少糖" value="littleSweet"></el-option>
            <el-option label="中糖" value="middleSweet"></el-option>
            <el-option label="多糖" value="manySweet"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="选择杯型" prop="cupType">
          <el-radio-group v-model="goods.cupType">
            <el-radio label="middleCup" value="middleCup">中杯({{
              goods.price == null ? "" : goods.price.middleCup
            }}元)</el-radio>
            <el-radio label="bigCup" value="bigCup">大杯({{
              goods.price == null ? "" : goods.price.bigCup
            }}元)</el-radio>
            <el-radio label="bigPlusCup" value="bigPlusCup">超大杯({{
              goods.price == null ? "" : goods.price.bigPlusCup
            }}元)</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="数量">
          <div class="num">
            <i class="el-icon-circle-plus" @click="add"></i>
            <span style="width:30px;display:inline-block;text-align:center">{{
            goods.buyNum
          }}</span>
            <i class="el-icon-remove" @click="dec"></i> 杯
          </div>
        </el-form-item>

        <el-form-item label="留言">
          <el-input type="textarea" v-model="goods.msg" placeholder="可以向我们提出建议哦~"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="onSubmit">{{
          buyTypeChinese[goods.buyType] == null
            ? goods.buyType
            : buyTypeChinese[goods.buyType]
        }}</el-button>
          <el-button @click="cancelOrder">取消</el-button>
        </el-form-item>
      </el-form>

    </el-dialog>
    <payWindow ref="payWindow" />

  </div>
</template>

<script>
  import payWindow from "@/components/payWindow"
  export default {
    mounted() {
      this.initForm();
    },
    components: {
      payWindow
    },
    data() {
      return {
        buyCar: null,
        dialogVisible: false,
        goods: {
          name: null,
          sweetNess: null,
          cupType: null,
          prise: null,
          imageUrl: null,
          msg: null,
          time: null,
          buyNum: 0,
          buyType: null
        },
        buyTypeChinese: {
          buy: "购买",
          addShoppingCar: "加购物车",
          updataGoodsInfo: "修改"
        },
        rules: {
          sweetNess: [
            {
              required: true,
              message: "请选择您需要的甜度哦~",
              trigger: "change"
            }
          ],
          cupType: [
            { required: true, message: "请选择你的杯型哦~", trigger: "change" }
          ]
        },
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
      add() {
        this.goods.buyNum += 1;
      },
      dec() {
        if (this.goods.buyNum >= 2) {
          this.goods.buyNum -= 1;
        } else {
          this.$message({
            message: "不可以再减少了哦",
            type: "warning"
          });
        }
      },
      onSubmit() {
        this.validate(flag => {
          if (flag) {

            this.dialogVisible = false;
            if (this.goods.buyType == "buy") {


              this.addOrder(this.goods);
              this.$message({
                message: "您成功购买了商品" + this.goods.name,
                type: "success"
              });

              this.$refs.payWindow.money = this.goods.price[this.goods.cupType];
              this.$refs.payWindow.canncelMsg = '确定取消订单吗?';
              this.$refs.payWindow.cancelBut = '取消订单';
              this.$refs.payWindow.centerDialogVisible = true;

            } else if (this.goods.buyType == "addShoppingCar") {
              this.addShoppingCar(this.goods);
              this.initForm();
              this.$refs["form"].resetFields();
            } else if (this.goods.buyType == "updataGoodsInfo") {
              var currGoods = this.buyCar[this.$parent.currentClickIndex];
              currGoods.buyNum = this.goods.buyNum;
              currGoods.sweetNess = this.goods.sweetNess;
              currGoods.cupType = this.goods.cupType;
              // this.buyCar.splice(this.$parent.currentClickIndex,1,currGoods)
              let index = 0;
              for (index; index < this.buyCar.length; index++) {
                const e = this.buyCar[index];
                // 如果不是当前元素 并且 与当前商品的属性一样的时候应该合并
                if (
                  index != this.$parent.currentClickIndex &&
                  e.name === this.goods.name &&
                  e.cupType === this.goods.cupType &&
                  e.sweetNess === this.goods.sweetNess
                ) {
                  currGoods.buyNum += e.buyNum;
                  break;
                }
              }
              // 去除掉后面同样的属性的商品
              this.buyCar.splice(index, 1);
              console.log(this.buyCar);
              this.setShoppingCar();
              // 调用父组件  刷新表格
              this.$parent.init();

              this.initForm();
              this.$refs["form"].resetFields();
            }
          } else {
            this.$message({ message: "请务必填写完整", type: "warning" });
            return;
          }
          /* 一定要初始化！ 不然 第一次加购物车以后 
          第二次再购买 会把之前购买的商品同步修改了 */
        // this.initForm();
         //this.$refs["form"].resetFields();
        });
      },
      addShoppingCar() {


        if (this.buyCar == "{}") {
          console.log("购物车为空");
          this.buyCar = new Array();
        }
        let addFlag = true;
        this.buyCar.forEach((e) => {
          if (e.name === this.goods.name &&
            e.cupType === this.goods.cupType &&
            e.sweetNess === this.goods.sweetNess) {
            addFlag = false;
            e.buyNum += this.goods.buyNum;
          }
        });
        // 如果当前购物车不存在同属性的商品
        if (addFlag) { this.buyCar.push(this.goods); }

        this.setShoppingCar();
        this.$message({
          message: this.goods.name + "已为您加入了购物车",
          type: "success"
        });
      },
      setShoppingCar() {
        this.$shoppingCar.setShoppringCar(this.buyCar);
      },
      cancelOrder() {
        this.dialogVisible = false;
        this.$refs["form"].resetFields();
      },
      handleClose(done) {
        done();
        this.$refs["form"].resetFields();
      },
      initForm() {
        this.goods.name = null;
        this.goods.sweetNess = null;
        this.goods.cupType = null;
        this.goods.prise = null;
        this.goods.imageUrl = null;
        this.goods.buyNum = 0;
        this.goods.msg = null;
        this.goods.time = null;
        this.goods.buyType = null;
        this.buyCar = this.$shoppingCar.getShoppringCar();

      },
      addOrder(param) {
        param = JSON.parse(JSON.stringify(param));
        //param.cupType = this.cuyTypeChinese[param.cupType];
        //param.sweetNess = this.cuyTypeChinese[param.sweetNess];
        
        if(this.$userGlobal.alreadyLogin()){
          let userInfo = this.$userGlobal.getUserInfo();
          param.vipId = userInfo.vipId;
        }
        this.$axios.post("/order/addPay", {
          param
        }, {
          headers: {
            'Content-type': 'application/json;charset=UTF-8'
          }
        }).then(response => {
          console.log(response);
        }).catch(function (error) {
          console.log(error);
        });
      },
      selectOrder(param) {

        this.$axios.get("/order/selectOrderByVipId", { param }).then(function (response) {
          console.log(response);
        })
      },
      validate(callback) {
        this.$refs["form"].validate(valid => {
          callback(valid);
        });
      }
      
    }
  };
</script>

<style scoped>
  .num {
    font-size: 20px;
    user-select: none;
  }

  .num i:nth-child(1):hover,
  .num i:nth-child(3):hover {
    color: blueviolet;
  }
</style>