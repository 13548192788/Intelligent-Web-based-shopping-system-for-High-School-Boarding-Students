<template>
  <div class="container">
    <div style="width: 400px; padding: 30px; background-color: white; border-radius: 5px;">
      <div style="text-align: center; font-size: 20px; margin-bottom: 20px; color: #333">Wlecome</div>
      <el-form :model="form" :rules="rules" ref="formRef">
        <el-form-item prop="username">
          <el-input prefix-icon="el-icon-user" placeholder="Please enter the account" v-model="form.username"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input prefix-icon="el-icon-lock" placeholder="Please enter the password" show-password  v-model="form.password"></el-input>
        </el-form-item>
        <el-form-item prop="confirmPass">
          <el-input prefix-icon="el-icon-lock" placeholder="Please confirm the password" show-password  v-model="form.confirmPass"></el-input>
        </el-form-item>
        <el-form-item>
          <el-select v-model="form.role" placeholder="Please choose role" style="width: 100%">
            <el-option label="Admin" value="ADMIN"></el-option>
            <el-option label="Seller" value="SELLER"></el-option>
            <el-option label="User" value="USER"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button style="width: 100%; background-color: #333; border-color: #333; color: white" @click="register">Register</el-button>
        </el-form-item>
        <div style="display: flex; align-items: center">
<!--          <div style="flex: 1"></div>-->
          <div style="flex: 1; text-align: right">
            Have account? Please <a href="/login">Login</a>
          </div>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
export default {
  name: "Register",
  data() {
    // 验证码校验
    const validatePassword = (rule, confirmPass, callback) => {
      if (confirmPass === '') {
        callback(new Error('Please confirm the password'))
      } else if (confirmPass !== this.form.password) {
        callback(new Error('The two passwords you entered did not match!'))
      } else {
        callback()
      }
    }
    return {
      form: {},
      rules: {
        username: [
          { required: true, message: 'Please enter the account', trigger: 'blur' },
        ],
        password: [
          { required: true, message: 'Please enter the password', trigger: 'blur' },
        ],
        confirmPass: [
          { validator: validatePassword, trigger: 'blur' }
        ]
      }
    }
  },
  created() {

  },
  methods: {
    register() {
      this.$refs['formRef'].validate((valid) => {
        if (valid) {
          // 验证通过
          this.$request.post('/register', this.form).then(res => {
            if (res.code === '200') {
              this.$router.push('/')  // 跳转登录页面
              this.$message.success('Register Successfully')
            } else {
              this.$message.error("Register error")
            }
          })
        }
      })
    }
  }
}
</script>

<style scoped>
.container {
  height: 100vh;
  overflow: hidden;
  background-image: url("@/assets/imgs/bg1.jpg");
  background-size: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
}
a {
  color: #2a60c9;
}
</style>