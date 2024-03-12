<template>
  <div class="main-content">
    <div style="width: 70%; background-color: white; margin: 30px auto; border-radius: 20px">
      <div style="padding-bottom: 10px">
        <div style="display: flex; font-size: 18px; color: #000000FF; line-height: 80px; border-bottom: #cccccc 1px solid;">
          <div style="flex: 3; margin-left: 20px">My Address</div>
          <div style="flex: 1; text-align: right; padding-right: 20px">
            <el-button type="warning" round @click="addAddress">Add</el-button>
          </div>
        </div>
        <div style="margin: 20px 0; padding: 0 50px">
          <div class="table">
            <el-table :data="addressData" strip>
              <el-table-column prop="username" label="Username" width="350px"></el-table-column>
              <el-table-column prop="useraddress" label="Address"></el-table-column>
              <el-table-column prop="phone" label="Phone"></el-table-column>
              <el-table-column label="Operation" align="center" width="180">
                <template v-slot="scope">
                  <el-button size="mini" type="primary" plain @click="editAddress(scope.row)">Edit</el-button>
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
    <el-dialog title="Address Information" :visible.sync="formVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
      <el-form label-width="100px" style="padding-right: 50px" :model="form" :rules="rules" ref="formRef">
        <el-form-item prop="username" label="Username">
          <el-input v-model="form.username" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="useraddress" label="Address">
          <el-input v-model="form.useraddress" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item prop="phone" label="Phone">
          <el-input v-model="form.phone" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="formVisible = false">Cancel</el-button>
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
      addressData: [],
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      total: 0,
      formVisible: false,
      form: {},
      rules: {
        username: [
          {required: true, message: 'Please enter name', trigger: 'blur'},
        ],
        useraddress: [
          {required: true, message: 'Please enter address', trigger: 'blur'},
        ],
        phone: [
          {required: true, message: 'Please enter phone number', trigger: 'blur'},
        ],
      },
    }
  },
  mounted() {
    this.loadAddress(1)
  },
  // methods：本页面所有的点击事件或者其他函数定义区
  methods: {
    addAddress() {
      this.form = {}
      this.formVisible = true
    },
    editAddress(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.formVisible = true
    },
    save() {   // 保存按钮触发的逻辑  它会触发新增或者更新
      this.$refs.formRef.validate((valid) => {
        if (valid) {
          this.form.userId = this.user.id
          this.$request({
            url: this.form.id ? '/address/update' : '/address/add',
            method: this.form.id ? 'PUT' : 'POST',
            data: this.form
          }).then(res => {
            if (res.code === '200') {  // 表示成功保存
              this.$message.success('Save Successfully')
              this.loadAddress(1)
              this.formVisible = false
            } else {
              this.$message.error(res.msg)  // 弹出错误的信息
            }
          })
        }
      })
    },
    loadAddress(pageNum) {
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/address/selectPage', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
        }
      }).then(res => {
        if (res.code === '200') {
          this.addressData = res.data?.list
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
      this.$request.delete('/address/delete/' + id).then(res => {
        if (res.code === '200') {
          this.$message.success('Delete Successfully')
          this.loadAddress(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    handleCurrentChange(pageNum) {
      this.loadAddress(pageNum)
    }
  }
}
</script>
