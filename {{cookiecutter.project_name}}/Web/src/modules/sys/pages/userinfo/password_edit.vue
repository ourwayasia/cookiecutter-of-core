<template>
  <of-dialog :title="formTitle" :isConfirm="isConfirm" @onCancel="cancel" @onConfirm="confirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="passwordInfo" :rules="editFormRules">
        <el-form-item label="旧密码：" prop="oldpass">
          <el-input placeholder="请输入旧密码" v-model="passwordInfo.oldpass" type="password" clearable></el-input>
        </el-form-item>
        <el-form-item label="新密码：" prop="newpass">
          <el-input placeholder="请输入新密码" v-model="passwordInfo.newpass" type="password" clearable></el-input>
        </el-form-item>
        <el-form-item label="确认新密码：" prop="password_confirm">
          <el-input placeholder="请再次输入新密码" v-model="passwordInfo.newpass1" type="password" clearable></el-input>
        </el-form-item>
      </el-form>
      <department-picker v-if="dialogVisible" :checkedData="departmentData"  @pickerCallBack="pickerCallBack"></department-picker>
    </div>
  </of-dialog>
</template>
<script>
import OfDialog from '@/components/controls/of_dialog/of_dialog'

export default {
  name: 'edit-password',
  props: {
    dataForm: {
      type: Object,
      default: null
    },
    formTitle: {
      type: String,
      default: ''
    }
  },
  data () {
    var validatePass = (rule, value, callback) => {
      if (this.passwordInfo.newpass1 === '') {
        callback(new Error('请再次输入密码'))
      } else if (this.passwordInfo.newpass !== this.passwordInfo.newpass1) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      editFormRules: {
        oldpass: [
          { required: true, message: '请输入旧密码', trigger: 'blur' }
        ],
        newpass: [
          { required: true, message: '请输入新密码', trigger: 'blur' }
        ],
        password_confirm: [
          { validator: validatePass, required: true }
        ]
      },
      isConfirm: false,
      dialogVisible: false,
      passwordInfo: {
        oldpass: '',
        newpass: '',
        newpass1: ''
      }
    }
  },
  components: {
    OfDialog
  },
  methods: {
    cancel () {
      this.$emit('formCallBack', null)
    },
    confirm () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.isConfirm = true
          this.passwordInfo.id = this.dataForm.Id
          let params = Object.assign({}, this.passwordInfo)
          this.$http.post('/Sys/Employee/ResetPassword', params).then((rep) => {
            this.isConfirm = false
            if (rep.data.Code === 0) {
              this.$message({
                message: '提交成功',
                type: 'success'
              })
              this.$emit('formCallBack', null)
            } else {
              this.$message({
                message: rep.data.Message,
                type: 'error'
              })
            }
          }).catch((e) => {
            this.isConfirm = false
            this.$message({
              message: e.toString(),
              type: 'error'
            })
          })
        }
      })
    }
  }
}
</script>
