<template>
  <div class="main-content">
    <div style="height: 10px; background-color: #C566F6FF"></div>
    <div style="display: flex">
      <div class="left"></div>
      <div style="width: 80%; background-color: #fffafa; margin-bottom: 50px">
        <div style="color: #355476; margin: 15px 0 15px 18px; font-weight: bold; font-size: 30px">Shopping Home</div>
        <div style="display: flex; margin: 0 25px; height: 350px">
          <div style="flex: 2">
            <div style="display: flex; color: #666666FF; margin: 14px 0" v-for="item in typeData">
              <img :src="item.img" alt="" style="height: 30px; width: 20px">
              <div style="margin-left: 10px; font-size: 17px"><a href="#" @click="navTo('/front/category?id=' + item.id)">{{item.name}}</a></div>
            </div>
          </div>
          <div style="flex: 5; margin-top: 15px">
            <div>
              <el-carousel height="350px" style="border-radius: 10px">
                <el-carousel-item v-for="item in carousel_top">
                  <img :src="item" alt="" style="width: 100%; height: 350px; border-radius: 10px">
                </el-carousel-item>
              </el-carousel>
            </div>
<!--            <div style="margin-top: 30px; display: flex">-->
<!--              <div style="flex: 1">-->
<!--                <el-carousel height="300px" style="border-radius: 10px">-->
<!--                  <el-carousel-item v-for="item in carousel_left">-->
<!--                    <img :src="item" alt="" style="width: 100%; height: 200px; border-radius: 10px">-->
<!--                  </el-carousel-item>-->
<!--                </el-carousel>-->
<!--              </div>-->
<!--              <div style="flex: 1; margin-left: 5px">-->
<!--                <el-carousel height="300px" style="border-radius: 10px">-->
<!--                  <el-carousel-item v-for="item in carousel_right">-->
<!--                    <img :src="item" alt="" style="width: 100%; height: 200px; border-radius: 10px">-->
<!--                  </el-carousel-item>-->
<!--                </el-carousel>-->
<!--              </div>-->
<!--            </div>-->
          </div>
          <div style="flex: 3; background-color: #F3F3F3FF; margin-top: 15px; margin-left: 15px; border-radius: 10px">
            <div style="text-align: center; margin-top: 10px">
              <img @click="navTo('/front/person')" :src="user.avatar" alt="" style="width: 80px; height: 80px; border-radius: 50%">
              <div style="margin-top: 10px">Hi，{{user.name}}</div>
            </div>
<!--            <div style="margin-top: 20px; padding: 0 15px">-->
<!--              <img src="@/assets/imgs/right.png" alt="" style="height: 150px; width: 100%; border-radius: 20px">-->
<!--            </div>-->
<!--            <div style="margin: 20px 10px 10px 10px; width: 250px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis">-->
<!--              <i class="el-icon-bell"></i>-->
<!--              <span style="font-weight: bold">Notice</span>-->
<!--              <span style="color: #666666;">：{{ top }}</span>-->
<!--            </div>-->
            <div style="display: flex; margin-top: 50px">
              <div style="flex: 1; text-align: center">
                <a href="#" @click="navTo('/front/collect')">
                  <img src="@/assets/imgs/collection.png" alt="" style="height: 25px; width: 25px">
                  <div>My Collection</div>
                </a>
              </div>
              <div style="flex: 1; text-align: center">
                <a href="#" @click="navTo('/front/address')">
                  <img src="@/assets/imgs/home.png" alt="" style="height: 25px; width: 25px">
                  <div>My Address</div>
                </a>
              </div>
              <div style="flex: 1; text-align: center">
                <a href="#" @click="navTo('/front/cart')">
                  <img src="@/assets/imgs/cart.png" alt="" style="height: 25px; width: 25px">
                  <div>My cart</div>
                </a>
              </div>
              <div style="flex: 1; text-align: center">
                <a href="#" @click="navTo('/front/orders')">
                  <img src="@/assets/imgs/order.png" alt="" style="height: 25px; width: 25px">
                  <div>My order</div>
                </a>
              </div>
            </div>
          </div>
        </div>
        <div style="margin: 40px 0 0 15px; height: 40px; background-color: #04BF04FF; font-size: 20px; color: white; width: 130px; font-weight: bold; line-height: 40px; text-align: center; border-radius: 20px">Hot</div>
        <div style="margin: 10px 5px 0 5px">
          <el-row>
            <el-col :span="5" v-for="item in productData">
              <img @click="navTo('/front/detail?id=' + item.id)" :src="item.img" alt="" style="Fwidth: 100%; height: 175px; border-radius: 10px; border: #cccccc 1px solid">
              <div @click="navTo('/front/detail?id=' + item.id)" style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 180px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">{{item.name}}</div>
              <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{item.price}}</div>
            </el-col>
          </el-row>
        </div>
        <div style="margin: 40px 0 0 15px; height: 40px; background-color: #04BF04FF; font-size: 20px; color: white; width: 200px; font-weight: bold; line-height: 40px; text-align: center; border-radius: 20px">Recommendation</div>
        <div style="margin: 10px 5px 0 5px">
          <el-row>
            <el-col :span="5" v-for="item in recommendData">
              <img @click="navTo('/front/detail?id=' + item.id)" :src="item.img" alt="" style="width: 100%; height: 175px; border-radius: 10px; border: #cccccc 1px solid">
              <div style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 180px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">{{item.name}}</div>
              <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{item.price}}}</div>
            </el-col>
          </el-row>
        </div>
      </div>
      <div class="right"></div>
    </div>
  </div>
</template>

<script>

export default {

  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      categoryData: [],
      top: null,
      notice: [],
      productData: [],
      recommendData: [],
      carousel_top: [
        require('@/assets/imgs/carousel-1.png'),
        require('@/assets/imgs/carousel-2.png'),
      ],
      carousel_left: [
        require('@/assets/imgs/carousel-3.png'),
        require('@/assets/imgs/carousel-4.png'),
      ],
      carousel_right: [
        require('@/assets/imgs/carousel-5.png'),
        require('@/assets/imgs/carousel-6.png'),
      ],
    }
  },
  mounted() {
    this.loadCategory()
    this.loadNotice()
    this.loadProduct()
    this.loadRecommend()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadRecommend() {
      this.$request.get('/product/recommend').then(res => {
        if (res.code === '200') {
          this.recommendData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadCategory() {
      this.$request.get('/category/selectAll').then(res => {
        if (res.code === '200') {
          this.typeData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadNotice() {
      this.$request.get('/notice/selectAll').then(res => {
        this.notice = res.data
        let i = 0
        if (this.notice && this.notice.length) {
          this.top = this.notice[0].content
          setInterval(() => {
            this.top = this.notice[i].content
            i++
            if (i === this.notice.length) {
              i = 0
            }
          }, 2500)
        }
      })
    },
    loadProduct() {
      this.$request.get('/product/selectAll').then(res => {
        if (res.code === '200') {
          this.productData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    navTo(url) {
      location.href = url
    },
  }
}
</script>

<style scoped>
.main-content {
  min-height: 100vh;
  /*overflow: hidden;*/
  background-size: 100%;
  background-image: url('@/assets/imgs/img.png');
}
.left {
  width: 17%;
  background-repeat: no-repeat;
  background-image: url('@/assets/imgs/left-img.png');
}
.right {
  width: 17%;
  background-repeat: no-repeat;
  background-image: url('@/assets/imgs/right-img.png')
}
.el-col-5{
  width: 20%;
  max-width: 20%;
  padding: 10px 10px;
}
</style>