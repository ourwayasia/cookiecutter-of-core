<template>
  <of-dialog :title="formTitle" @onCancel="cancel" @onConfirm="confirm" :isConfirm="isConfirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="dataForm" :rules="editFormRules">
        <el-form-item label="模块标识：" prop="ModuleKey">
          <el-input placeholder="请输入模块标识" v-model="dataForm.ModuleKey" clearable></el-input>
        </el-form-item>
        <el-form-item label="模块名称：" prop="ModuleName">
          <el-input placeholder="请输入模块名称" v-model="dataForm.ModuleName" clearable></el-input>
        </el-form-item>
        <el-form-item label="应用名称：" prop="ApplicationName">
          <el-input placeholder="请输入应用名称" v-model="dataForm.ApplicationName" clearable></el-input>
        </el-form-item>
      </el-form>
    </div>
  </of-dialog>
</template>
<script>
import OfDialog from '@/components/controls/of_dialog/of_dialog'
import { saveModule } from '@/modules/sys/api/module.js'


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
        ModuleKey: [
          { required: true, message: '请输入模块标识', trigger: 'blur' }
        ],
        ModuleName: [
          { required: true, message: '请输入模块名称', trigger: 'blur' }
        ],
        ApplicationName: [
          { required: true, message: '请输入应用名称', trigger: 'blur' }
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
          saveModule(params).then((rep) => {
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
