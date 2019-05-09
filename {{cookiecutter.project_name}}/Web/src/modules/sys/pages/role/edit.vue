<template>
  <of-dialog :title="formTitle" @onCancel="cancel" @onConfirm="confirm" :isConfirm="isConfirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="dataForm" :rules="editFormRules">
        <el-form-item label="角色名称：" prop="RoleName">
          <el-input placeholder="请输入角色名称" v-model="dataForm.RoleName" clearable></el-input>
        </el-form-item>
        <el-form-item label="排序号：" prop="SortNum">
          <el-input-number v-model="dataForm.SortNum" :min="0" :max="1000" size="small"></el-input-number>
        </el-form-item>
        <el-form-item label="状态：">
          <el-radio-group v-model="dataForm.Status">
            <el-radio :label="1">已启用</el-radio>
            <el-radio :label="0">已禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
    </div>
  </of-dialog>
</template>
<script>
import OfDialog from '@/components/controls/of_dialog/of_dialog'
import { saveRole } from '@/modules/sys/api/role.js'


export default {
  name: 'sys-role-edit',
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
        RoleName: [
          { required: true, message: '请输入角色名称', trigger: 'blur' }
        ],
          SortNum: [
          { required: true, message: '请输入排序号', trigger: 'blur' }
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
          saveRole(params).then((rep) => {
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
.form-warpper {
  padding-right: 20px;
}
</style>
