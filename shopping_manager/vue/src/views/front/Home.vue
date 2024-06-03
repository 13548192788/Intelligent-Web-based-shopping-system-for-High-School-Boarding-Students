<template>
  <div class="main-content">
    <div style="height: 2px; background-color: #fffafa"></div>
    <div style="display: flex">
<!--      <div class="left"></div>-->
      <div style="width: 100%; background-color: #fffafa; margin-bottom: 10px">
<!--        <div style="color: #355476; margin: 15px 0 15px 18px; font-weight: bold; font-size: 30px">Shopping Home</div>-->
        <div style="display: flex; margin: 0 5px; height: 500px">
          <div style="flex: 5; margin-top: 0px">
            <div>
              <el-carousel height="500px" style="border-radius: 0px">
                <el-carousel-item v-for="item in carousel_top">
                  <img :src="item" alt="" style="width: 100%; height: 500px; border-radius: 10px">
                </el-carousel-item>
              </el-carousel>
            </div>
          </div>
        </div>
        <div style="margin: 40px 0 0 15px; height: 40px; background-color: #C299BA; font-size: 20px; color: white; width: 130px; font-weight: bold; line-height: 40px; text-align: center; border-radius: 20px">Hot</div>
        <div style="margin: 10px 5px 0 5px">
          <el-row style="margin-bottom: -20px;">
            <el-col :span="5" v-for="item in productData" style="width: 200px; margin-right: 20px; margin-bottom: 20px;">
              <div style="width: 200px; height: 250px; display: flex; flex-direction: column; align-items: center; border-radius: 10px; border: #cccccc 1px solid; overflow: hidden;">
                <img @click="navTo('/front/detail?id=' + item.id)" :src="item.img" alt="" style="width: 100%; height: 175px; border-radius: 10px; border: #cccccc 1px solid">
                <div @click="navTo('/front/detail?id=' + item.id)" style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 180px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">{{item.name}}</div>
                <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{item.price}}</div>
              </div>
            </el-col>
          </el-row>
        </div>
        <div style="margin: 40px 0 0 15px; height: 40px; background-color: #C299BA; font-size: 20px; color: white; width: 200px; font-weight: bold; line-height: 40px; text-align: center; border-radius: 20px">Recommendation</div>
        <div style="margin: 10px 5px 0 5px">
          <el-row>
            <el-col :span="5" v-for="item in recommendData">
              <div style="width: 200px; height: 250px; display: flex; flex-direction: column; align-items: center; border-radius: 10px; border: #cccccc 1px solid; overflow: hidden;">
                <img @click="navTo('/front/detail?id=' + item.id)" :src="item.img" alt="" style="width: 100%; height: 175px; border-radius: 10px; border: #cccccc 1px solid">
                <div @click="navTo('/front/detail?id=' + item.id)" style="margin-top: 10px; font-weight: 500; font-size: 16px; width: 180px; color: #000000FF; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">{{item.name}}</div>
                <div style="margin-top: 5px; font-size: 20px; color: #FF5000FF">￥ {{item.price}}</div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
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
      productData: [],
      recommendData: [],
      carousel_top: [
        require('@/assets/imgs/carousel-1.png'),
        require('@/assets/imgs/carousel-2.png'),
      ],
    }
  },
  mounted() {
    this.loadCategory()
    this.loadProduct()
    this.loadRecommend()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadRecommend() {
      this.$request.get('/product/recommend').then(res => {
        if (res.code === '200') {
          console.log(res.data); // 打印返回的推荐商品数据
          this.recommendData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadCategory() {
      this.$request.get('/category/selectAll').then(res => {
        if (res.code === '200') {
          this.categoryData = res.data
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
      this.$request.get('/product/selectTop12').then(res => {
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