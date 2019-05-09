<template>
  <of-dialog :title="formTitle" @onCancel="cancel" @onConfirm="confirm" :isConfirm="isConfirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="dataForm" :rules="editFormRules">
        <el-form-item label="模块标识：" prop="ModuleKey">
          <el-input placeholder="请输入模块标识" v-model="dataForm.ModuleKey" clearable></el-input>
        </el-form-item>
        <el-form-item label="权限名称：" prop="Name">
          <el-input placeholder="请输入权限名称" v-model="dataForm.Name" clearable></el-input>
        </el-form-item>
        <el-form-item label="操作集合：" prop="operationTags">
          <el-tag :key="tag" v-for="tag in operationTags" closable :disable-transitions="false" @close="operationInputClose(tag)">
            {{tag}}
          </el-tag>
          <el-input class="input-new-tag" v-if="operationInputVisible" v-model="operationValue" ref="operationInput" size="small" @keyup.enter.native="operationInputConfirm" @blur="operationInputConfirm">
          </el-input>
          <el-button v-else class="button-new-tag" size="small" @click="addOperation">+ 添加操作</el-button>
        </el-form-item>
        <el-form-item label="动作集合：" prop="actionTags">
          <el-tag :key="tag" v-for="tag in actionTags" closable :disable-transitions="false" @close="actionInputClose(tag)">
            {{tag}}
          </el-tag>
          <el-input class="input-new-tag" v-if="actionInputVisible" v-model="actionValue" ref="actionInput" size="small" @keyup.enter.native="actionInputConfirm" @blur="actionInputConfirm">
          </el-input>
          <el-button v-else class="button-new-tag" size="small" @click="addAction">+ 添加动作</el-button>
        </el-form-item>
      </el-form>
    </div>
  </of-dialog>
</template>
<script>
import OfDialog from '@/components/controls/of_dialog/of_dialog'
import { savePermission } from '@/modules/sys/api/permission.js'


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
    var checkOperation = (rule, value, callback) => {
      if (this.operationTags.length === 0) {
        return callback(new Error('请至少添加一个操作'))
      }
      callback()
    }
    var checkAction = (rule, value, callback) => {
      if (this.actionTags.length === 0) {
        return callback(new Error('请至少添加一个动作'))
      }
      callback()
    }
    return {
      editFormRules: {
        ModuleKey: [
          { required: true, message: '请输入模块标识', trigger: 'blur' }
        ],
        Name: [
          { required: true, message: '请输入权限名称', trigger: 'blur' }
        ],
        operationTags: [
          { required: true, validator: checkOperation }
        ],
        actionTags: [
          { required: true, validator: checkAction }
        ]
      },
      isConfirm: false,
      operationTags: [],
      actionTags: [],
      operationInputVisible: false,
      actionInputVisible: false,
      operationValue: '',
      actionValue: ''
    }
  },
  components: {
    OfDialog
  },
  mounted () {
    if (this.dataForm.Operations) {
      this.operationTags = this.dataForm.Operations.split('|')
    }
    if (this.dataForm.Actions) {
      this.actionTags = this.dataForm.Actions.split('|')
    }
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
          params.Operations = this.operationTags.join('|')
          params.Actions = this.actionTags.join('|')
          savePermission(params).then((rep) => {
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
    },
    addOperation () {
      this.operationInputVisible = true
      this.$nextTick(() => {
        this.$refs.operationInput.$refs.input.focus()
      })
    },
    operationInputConfirm () {
      let inputValue = this.operationValue
      if (inputValue) {
        this.operationTags.push(inputValue)
      }
      this.operationInputVisible = false
      this.operationValue = ''
    },
    operationInputClose (tag) {
      this.operationTags.splice(this.operationTags.indexOf(tag), 1)
    },
    addAction () {
      this.actionInputVisible = true
      this.$nextTick(() => {
        this.$refs.actionInput.$refs.input.focus()
      })
    },
    actionInputConfirm () {
      let inputValue = this.actionValue
      if (inputValue) {
        this.actionTags.push(inputValue)
      }
      this.actionInputVisible = false
      this.actionValue = ''
    },
    actionInputClose (tag) {
      this.actionTags.splice(this.actionTags.indexOf(tag), 1)
    }
  }
}
</script>

<style scoped>
.el-textarea > textarea {
  height: 80px;
}
.input-new-tag {
  width: 90px;
  margin-left: 10px;
}
button-new-tag,
.el-tag + .el-tag {
  margin-left: 10px;
}
</style>
