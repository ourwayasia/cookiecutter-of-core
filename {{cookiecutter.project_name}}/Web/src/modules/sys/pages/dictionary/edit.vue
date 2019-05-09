<template>
  <of-dialog :title="formTitle" @onCancel="cancel" @onConfirm="confirm" :isConfirm="isConfirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="dataForm" :rules="editFormRules">
        <el-form-item label="上级字典：">
          <el-select v-model="dataForm.ParentId" clearable placeholder="请选择上级字典" style="width:100%">
            <el-option v-for="item in dataForm.Options" :key="item.ParentId" :label="item.ParentName" :value="item.ParentId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="字典名称：" prop="ItemText">
          <el-input placeholder="请输入字典名称" v-model="dataForm.ItemText" clearable></el-input>
        </el-form-item>
        <el-form-item label="字典键名：">
          <el-input placeholder="请输入字典键名" v-model="dataForm.ItemKey" clearable></el-input>
        </el-form-item>
        <el-form-item label="字典键值：">
          <el-input placeholder="请输入字典键值" v-model="dataForm.ItemValue" clearable></el-input>
        </el-form-item>
        <el-form-item label="排序号：">
          <el-input-number v-model="dataForm.SortNum" :min="0" :max="100" size="small"></el-input-number>
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

import { saveDictionary } from '@/modules/sys/api/dictionary.js'


export default {
  name: 'sys-dictionary-edit',
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
        ItemText: [
          { required: true, message: '请输入字典名称', trigger: 'blur' }
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
          saveDictionary(params).then((rep) => {
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
</style>
