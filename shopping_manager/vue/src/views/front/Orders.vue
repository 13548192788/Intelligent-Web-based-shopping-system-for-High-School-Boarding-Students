<template>
  <div class="main-content">
    <div style="width: 80%; background-color: #F9F6ED; margin: 2px auto; border-radius: 20px">
      <div style="padding-bottom: 10px">
        <div style="font-size: 18px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid;">
          <div style="margin-left: 20px; font-size: 24px;">My Orders</div>
        </div>
        <div style="margin: 20px 0; padding: 0 50px">
          <div class="table" style="overflow: auto;">
<!--            表单滑动-->
            <el-table :data="ordersData" strip>
              <el-table-column label="Image" width="120px">
                <template v-slot="scope">
                  <el-image style="width: 80px; height: 60px; border-radius: 3px" v-if="scope.row.productImg"
                            :src="scope.row.productImg" :preview-src-list="[scope.row.productImg]"></el-image>
                </template>
              </el-table-column>
              <el-table-column prop="orderId" label="Order ID"></el-table-column>
              <el-table-column prop="productName" label="Product Name" :show-overflow-tooltip="true">
                <template v-slot="scope">
                  <a :href="'/front/detail?id=' + scope.row.productId">{{scope.row.productName}}</a>
                </template>
              </el-table-column>
              <el-table-column prop="sellerName" label="Seller">
                <template v-slot="scope">
                  <a :href="'/front/seller?id=' + scope.row.sellerId">{{scope.row.sellerName}}</a>
                </template>
              </el-table-column>
              <el-table-column prop="productPrice" label="Price">
                <template v-slot="scope">
                  {{scope.row.productPrice}}
                </template>
              </el-table-column>
              <el-table-column prop="num" label="Count"></el-table-column>
              <el-table-column prop="price" label="Total"></el-table-column>
              <el-table-column prop="username" label="Username" width="90"></el-table-column>
              <el-table-column prop="useraddress" label="Address"></el-table-column>
              <el-table-column prop="phone" label="Phone"></el-table-column>
              <el-table-column prop="status" label="Status"></el-table-column>
              <el-table-column label="Operation" align="center" width="180">
                <template v-slot="scope">
                  <el-button size="mini" type="primary" v-if="scope.row.status === 'Waiting'" plain @click="updateStatus(scope.row, 'Complete')">Confirm </el-button>
                  <el-button size="mini" type="primary" v-if="scope.row.status === 'Complete'" plain @click="addComment(scope.row)">Comment</el-button>
                  <el-button size="mini" type="danger" plain @click="del(scope.row.id)">Delete</el-button>
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
    <el-dialog title="Please enter comment" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" label-width="100px" style="padding-right: 50px" :rules="rules" ref="formRef">
        <el-form-item label="Content" prop="username">
          <el-input type="textarea" v-model="form.content" placeholder="Please enter content"></el-input>
        </el-form-item>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="fromVisible = false">Cancel</el-button>
        <el-button type="primary" @click="save">Confirm</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>

export default {

  data() {
    return {
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      ordersData: [],
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      total: 0,
      form: {},
      fromVisible: false
    }
  },
  mounted() {
    this.loadOrders(1, this.user.id)
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadOrders(pageNum) {
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/orders/selectPage', {
        params: {
          userId: this.user.id,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        if (res.code === '200') {
          this.ordersData = res.data?.list
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
      this.$request.delete('/orders/delete/' + id).then(res => {
        if (res.code === '200') {
          this.$message.success('Delete Successfully')
          this.loadOrders(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleCurrentChange(pageNum) {
      this.loadOrders(pageNum)
    },
    updateStatus(row, status) {
      this.form = row
      this.form.status = status
      this.$request.put('/orders/update', this.form).then(res => {
        if (res.code === '200') {
          this.$message.success('Operation Successfully')
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    addComment(row) {
      this.fromVisible = true
      this.form = row
    },
    save() {
      let data = {
        userId: this.user.id,
        sellerId: this.form.sellerId,
        productId: this.form.productId,
        content: this.form.content,
      }
      this.$request.post('/comment/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('Comment Successfully')
          this.fromVisible = false
          this.updateStatus(this.form, 'Commented')
          this.form = {}
        } else {
          this.$message.error(res.msg)
        }
      })
    }
  }
}
</script>
