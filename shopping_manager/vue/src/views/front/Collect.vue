<template>
  <div class="main-content">
    <div style="width: 70%; background-color: #F9F6ED; margin: 10px auto; border-radius: 20px">
      <div style="padding-bottom: 10px">
        <div style="font-size: 18px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid;">
          <div style="margin-left: 20px; font-size: 24px; line-height: 50px"> My Collection</div>
          <div style="margin-left: 20px"> Total {{ collectData.length }} products </div>
        </div>
        <div style="margin: 20px 0; padding: 0 50px">
          <div class="table">
            <el-table :data="collectData" strip>
              <el-table-column label="Image" width="120px">
                <template v-slot="scope">
                  <el-image style="width: 80px; height: 60px; border-radius: 3px" v-if="scope.row.productImg"
                            :src="scope.row.productImg" :preview-src-list="[scope.row.productImg]"></el-image>
                </template>
              </el-table-column>
              <el-table-column prop="productName" label="Product Name" width="300px">
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
              <el-table-column label="Operation" align="center" width="180">
                <template v-slot="scope">
                  <el-button size="mini" type="danger" plain @click="del(scope.row.id)">Remove</el-button>
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
      collectData: [],
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      total: 0,
    }
  },
  mounted() {
    this.loadCollect(1, this.user.id)
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    loadCollect(pageNum) {
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/collect/selectPage', {
        params: {
          userId: this.user.id,
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        if (res.code === '200') {
          this.collectData = res.data?.list
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
      this.$request.delete('/collect/delete/' + id).then(res => {
        if (res.code === '200') {
          this.$message.success('Delete Successfully')
          this.loadCollect(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleCurrentChange(pageNum) {
      this.loadCollect(pageNum)
    }
  }
}
</script>
