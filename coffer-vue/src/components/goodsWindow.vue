<template>
  <el-dialog
    title="选择商品属性"
    :visible.sync="dialogVisible"
    width="35%"
    :before-close="handleClose"
  >
    <el-form ref="form" :model="goods" label-width="80px" :rules="rules">
      <img
        :src="goods.imageUrl"
        alt=""
        width="60px"
        style="position: relative;left: 45%;"
      />
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
          <el-radio label="middleCup" value="middleCup"
            >中杯({{
              goods.price == null ? "" : goods.price.middleCup
            }}元)</el-radio
          >
          <el-radio label="bigCup" value="bigCup"
            >大杯({{
              goods.price == null ? "" : goods.price.bigCup
            }}元)</el-radio
          >
          <el-radio label="bigPlusCup" value="bigPlusCup"
            >超大杯({{
              goods.price == null ? "" : goods.price.bigPlusCup
            }}元)</el-radio
          >
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
        <el-input
          type="textarea"
          v-model="goods.msg"
          placeholder="可以向我们提出建议哦~"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">{{
          buyTypeChinese[goods.buyType]==null?goods.buyType:buyTypeChinese[goods.buyType]
        }}</el-button>
        <el-button @click="cancelOrder">取消</el-button>
      </el-form-item>
    </el-form>
  </el-dialog>
</template>

<script>
export default {
  mounted() {
    this.initForm();
  },

  data() {
    return {
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
        addShoppingCar: "加购物车"
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
            this.$message({
              message: "您成功购买了商品" + this.goods.name,
              type: "success"
            });
          } else if (this.goods.buyType == "addShoppingCar") {
            this.addShoppingCar(this.goods);
          } else if (this.goods.buyType == "updataGoodsInfo") {
            this.$message({ message: "您更新了商品信息", type: "success" });
          }
        } else {
          this.$message({ message: "请务必填写完整", type: "warning" });
        }
      });
    },
    addShoppingCar() {
      var car = this.$shoppingCar.getShoppringCar();
      console.log(car)
      if (car == '{}') {
        console.log("购物车为空")
        car = new Array();
      } 
      car.push(this.goods);
      this.$shoppingCar.setShoppringCar(car);
        this.$message({
          message: this.goods.name + "已为您加入了购物车",
          type: "success"
        });
    },
    cancelOrder() {
      this.dialogVisible = false;
      this.$refs["form"].resetFields();
    },
    handleClose(done) {
      this.$refs["form"].resetFields();
      done();
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
