<template>
  <of-dialog :title="formTitle" @onCancel="cancel" @onConfirm="confirm" :isConfirm="isConfirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="dataForm" :rules="editFormRules">
        <el-form-item label="配置键：" prop="ConfigKey">
          <el-input placeholder="请输入配置键" v-model="dataForm.ConfigKey" clearable></el-input>
        </el-form-item>
        <el-form-item label="配置名称：" prop="ConfigName">
          <el-input placeholder="请输入配置名称" v-model="dataForm.ConfigName" clearable></el-input>
        </el-form-item>
        <el-form-item label="配置描述：">
          <el-input type="textarea" placeholder="请输入配置描述" v-model="dataForm.Description"></el-input>
        </el-form-item>
        <el-form-item label="配置值：">
          <el-input type="textarea" placeholder="请输入配置值" v-model="dataForm.ConfigValue"></el-input>
        </el-form-item>
      </el-form>
    </div>
  </of-dialog>
</template>
<script>
import OfDialog from '@/components/controls/of_dialog/of_dialog'

import { saveConfig } from '@/modules/sys/api/config.js'

export default {
  name: 'sys-config-edit',
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
    return {
      editFormRules: {
        ConfigKey: [
          { required: true, message: '请输入配置键', trigger: 'blur' }
        ],
        ConfigName: [
          { required: true, message: '请输入配置名称', trigger: 'blur' }
        ]
      },
      isConfirm: false
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
          let params = Object.assign({}, this.dataForm)
          saveConfig(params).then((rep) => {
            this.isConfirm = false
            if (rep.data.Code === 0) {
              this.$message({
                message: '提交成功',
                type: 'success'
              })
              this.$emit('formCallBack', params)
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

<style scoped>
.el-textarea > textarea {
  height: 80px;
}
</style>
