<template>
  <div class="main-content">
    <div style="width: 70%; background-color: #FDF5E6; margin: 30px auto; border-radius: 20px">
      <div style="padding-bottom: 10px">
        <div style="margin-left: 20px; font-size: 24px; line-height: 50px"> My Cart</div>
        <div style="display: flex; font-size: 18px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid;">
          <div style="margin-left: 20px; flex: 1">Total {{ productData.length }} products</div>
          <div style="flex: 2; text-align: right">
            <el-select v-model="addressId" placeholder="Please choose address" style="width: 70%">
              <el-option v-for="item in addressData" :label="item.username + ' - ' + item.useraddress + ' - ' + item.phone" :value="item.id"></el-option>
            </el-select>
          </div>
          <div style="flex: 1; font-size: 16px; text-align: right; padding-right: 20px">
            Total ￥ {{totalPrice}} <el-button type="danger" round @click="pay">Buy</el-button>
          </div>
        </div>
        <div style="margin: 20px 0; padding: 0 50px">
          <div class="table">
            <el-table :data="productData" strip @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55" align="center"></el-table-column>
              <el-table-column label="Product Image" width="120px">
                <template v-slot="scope">
                  <el-image style="width: 80px; height: 60px; border-radius: 3px" v-if="scope.row.productImg"
                            :src="scope.row.productImg" :preview-src-list="[scope.row.productImg]"></el-image>
                </template>
              </el-table-column>
              <el-table-column prop="productName" label="Product Name" width="180px">
                <template v-slot="scope">
                  <a :href="'/front/detail?id=' + scope.row.productId">{{scope.row.productName}}</a>
                </template>
              </el-table-column>
              <el-table-column prop="sellerName" label="Seller Name">
                <template v-slot="scope">
                  <a :href="'/front/seller?id=' + scope.row.sellerId">{{scope.row.sellerName}}</a>
                </template>
              </el-table-column>
              <el-table-column prop="productPrice" label="Price"></el-table-column>
              <el-table-column prop="num" label="Count">
                <template v-slot="scope">
                  <el-input-number v-model="scope.row.num" style="width: 100px" @change="handleChange(scope.row)" :min="1"></el-input-number>
                </template>
              </el-table-column>
              <el-table-column label="Operation" align="center" width="180">
                <template v-slot="scope">
                  <el-button size="mini" type="danger" plain @click="del(scope.row.id)">remove</el-button>
                </template>
              </el-table-column>
            </el-table>

            <div class="pagination" style="margin-top: 20px">
              <el-pagination
                  background
                  @current-change="handleCurrentChange"
                  :current-page="pageNum"
                  :page-sizes="[5, 10, 20]"
                  :page-size="pageSize"
                  layout="total, prev, pager, next"
                  :total="total">
              </el-pagination>
            </div>
          </div>
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
      productData: [],
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      totalPrice: 0,
      total: 0,
      addressId: null,
      addressData: [],
      selectedData: [],
    }
  },
  mounted() {
    this.loadProduct(1)
    this.loadAddress()
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadAddress() {
      this.$request.get('/address/selectAll').then(res => {
        if (res.code === '200') {
          this.addressData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadProduct(pageNum) {
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/cart/selectPage', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        if (res.code === '200') {
          this.productData = res.data?.list
          this.total = res.data?.total
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    navTo(url) {
      location.href = url
    },
    del(id) {
      this.$request.delete('/cart/delete/' + id).then(res => {
        if (res.code === '200') {
          this.$message.success('Delete Successfully')
          this.loadProduct(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleCurrentChange(pageNum) {
      this.loadProduct(pageNum)
    },
    handleSelectionChange(rows) {
      this.totalPrice = 0
      this.selectedData = rows
      // 计计算总价格
      this.selectedData.forEach(item => {
        this.totalPrice += (item.productPrice * item.num)
      })
    },
    handleChange(row) {
      this.totalPrice = 0
      this.selectedData.forEach(item => {
        this.totalPrice += item.productPrice * item.num
      })
    },
    pay() {
      if (!this.addressId) {
        this.$message.warning('Please select address')
        return
      }
      if (!this.selectedData || this.selectedData.length === 0) {
        this.$message.warning('Please choose product')
        return
      }
      let data = {
        userId: this.user.id,
        addressId: this.addressId,
        status: 'Waiting',
        cartData: this.selectedData
      }
      this.$request.post('/orders/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('Operation Successfully')
          this.loadProduct(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    }
  }
}
</script>
