<template>
  <of-dialog :title="formTitle" :isConfirm="isConfirm" @onCancel="cancel" @onConfirm="confirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model={} :rules="editFormRules">
        <el-form-item label="新密码：" prop="newpass">
          <el-input placeholder="请输入新密码" v-model="newpass" type="password" clearable></el-input>
        </el-form-item>
        <el-form-item label="确认新密码：" prop="password_confirm">
          <el-input placeholder="请再次输入新密码" v-model="newpass1" type="password" clearable></el-input>
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
    var validateNewPass = (rule, value, callback) => {
      if (this.newpass === '') {
        callback(new Error('请输入新密码'))
      } else if (this.validateNewPass) {
        var reg = /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{8,16}$/
        if (!reg.test(this.newpass)) {
          callback(new Error('新密码含有大小写字母、数字、特殊符号的两种及以上，且长度要在8-16位之间'))
        } else { callback() }
      } else { callback() }
    }
    var validatePass = (rule, value, callback) => {
      if (this.newpass1 === '') {
        callback(new Error('请再次输入密码'))
      } else if (this.newpass !== this.newpass1) {
        callback(new Error('两次输入密码不一致!'))
      } else {
        callback()
      }
    }
    return {
      editFormRules: {
        newpass: [
          { validator: validateNewPass, required: true }
        ],
        password_confirm: [
          { validator: validatePass, required: true }
        ]
      },
      isConfirm: false,
      dialogVisible: false,
      newpass: '',
      newpass1: ''
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
          this.$http.post('/Sys/Employee/EditPassword', {Id: this.dataForm.Id, NewPass: this.newpass}).then((rep) => {
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
    },
    SystemCheckPwdFormat () {
      let ret = 0
      let currentConfig = this.$store.getters.GetCurrentConfig
      if (currentConfig && currentConfig.SystemPwdFormat) {
        ret = currentConfig.SystemPwdFormat
      }
      return ret
    }
  },
  mounted () {
    this.validateNewPass = this.SystemCheckPwdFormat()
  }
}
</script>
