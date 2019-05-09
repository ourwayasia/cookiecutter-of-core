<template>
  <of-dialog :title="formTitle" :isConfirm="isConfirm" @onCancel="cancel" @onConfirm="confirm">
    <div slot="content">
      <el-form ref="form" label-width="120px" :model="dataForm" :rules="editFormRules">
        <el-form-item label="员工编号：" prop="EmployeeNo">
          <el-input placeholder="请输入员工编号" v-model="dataForm.EmployeeNo" clearable>
            <!-- <template slot="append">
              <el-button size="small" @click="onSelectUser">选择人员</el-button>
            </template> -->
          </el-input>
        </el-form-item>
        <el-form-item label="员工账号：" prop="Account">
          <el-input placeholder="请输入员工账号" v-model="dataForm.Account" clearable></el-input>
        </el-form-item>
        <el-form-item label="昵称：" prop="Nickname">
          <el-input placeholder="请输入昵称" v-model="dataForm.Nickname" clearable></el-input>
        </el-form-item>
        <el-form-item label="真实姓名：" prop="RealName">
          <el-input placeholder="请输入真实姓名" v-model="dataForm.RealName" clearable></el-input>
        </el-form-item>
        <el-form-item label="拼音：" prop="Spell">
          <el-input placeholder="请输入拼音" v-model="dataForm.Spell" clearable></el-input>
        </el-form-item>
        <el-form-item label="联系电话：">
          <el-input placeholder="请输入联系电话" v-model="dataForm.MobileNo" clearable></el-input>
        </el-form-item>
        <el-form-item label="电子邮箱：">
          <el-input placeholder="请输入电子邮箱" v-model="dataForm.Email" clearable></el-input>
        </el-form-item>
        <el-form-item label="部门：" prop="DepartmentName">
          <el-input placeholder="请选择部门" v-model="dataForm.DepartmentName" :disabled="true">
            <el-button slot="append" @click="showDepartmentPicker">选择</el-button>
          </el-input>
        </el-form-item>
        <el-form-item label="出生日期：">
          <el-form-item>
            <el-date-picker type="date" placeholder="选择日期" v-model="dataForm.Birthday" style="width: 100%;"></el-date-picker>
          </el-form-item>
        </el-form-item>
        <el-form-item label="性别：">
          <el-radio-group v-model="dataForm.Sex">
            <el-radio :label="1">男</el-radio>
            <el-radio :label="2">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否内部员工：">
          <el-radio-group v-model="dataForm.IsStaff">
            <el-radio :label="1">是</el-radio>
            <el-radio :label="0">否</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="职级：" prop="Level">
          <el-input-number v-model="dataForm.Level" :min="0" :max="100" size="small"></el-input-number>
        </el-form-item>
        <el-form-item label="状态：">
          <el-radio-group v-model="dataForm.Status">
            <el-radio :label="1">已启用</el-radio>
            <el-radio :label="0">已禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <select-usercenter-user v-if="selectUserVisible" @formCallBack="selectUserCallBack" formTitle="选择人员"></select-usercenter-user>
      <department-picker v-if="dialogVisible" :checkedData="departmentData" @pickerCallBack="pickerCallBack"></department-picker>
    </div>
  </of-dialog>
</template>
<script>
import DepartmentPicker from '@/modules/sys/components/picker/department'
import OfDialog from '@/components/controls/of_dialog/of_dialog'
import moment from 'moment'
import SelectUsercenterUser from '@/modules/sys/pages/employee/select_usercenter_user'

import { saveEmployee } from '@/modules/sys/api/employee.js'

export default {
  name: 'sys-employee-edit',
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
        EmployeeNo: [
          { required: true, message: '请输入员工编号', trigger: 'blur' }
        ],
        RealName: [
          { required: true, message: '请输入员工真实姓名', trigger: 'blur' }
        ],
        DepartmentName: [
          { required: true, message: '请选择部门', trigger: 'blur' }
        ]
      },
      selectUserVisible: false,
      isConfirm: false,
      dialogVisible: false,
      departmentData: []
    }
  },
  mounted () {
    if (!this.dataForm.Id) {
      this.dataForm.Sex = 1
      this.dataForm.Status = 1
    } else {
      if (this.dataForm.Birthday) {
        this.dataForm.Birthday = moment(this.dataForm.Birthday).format('YYYY-MM-DD')
      }
    }
  },
  components: {
    DepartmentPicker,
    OfDialog,
    SelectUsercenterUser

  },
  methods: {
    cancel () {
      this.$emit('formCallBack', null)
    },
    onSelectUser () {
      this.selectUserVisible = true
    },
    selectUserCallBack (user) {
      this.selectUserVisible = false
      if (!user) {
        return
      }

      this.dataForm.EmployeeNo = user.userId
      this.dataForm.Account = user.userId
      this.dataForm.Nickname = user.userName
      this.dataForm.RealName = user.userName.replace(/\[.*\]/ig, '')
      this.dataForm.Spell = user.userNamePy
      this.dataForm.MobileNo = user.cellphoneNo
      this.dataForm.Email = user.email
      this.dataForm.Sex = user.userSex === '男' ? 1 : user.userSex === '女' ? 2 : 0
    },
    confirm () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.isConfirm = true
          let params = Object.assign({}, this.dataForm)
          saveEmployee(params).then((rep) => {
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
    showDepartmentPicker () {
      this.dialogVisible = true
      if (this.dataForm.DepartmentId) {
        const departmentName = this.dataForm.DepartmentName.split('/')
        this.departmentData = [{
          id: this.dataForm.DepartmentId,
          text: departmentName.length > 1 ? departmentName[departmentName.length - 1] : departmentName[0]
        }]
      }
    },
    pickerCallBack (data) {
      this.dialogVisible = false
      if (data) {
        this.dataForm.DepartmentName = data.text
        this.dataForm.DepartmentId = data.id
      }
    }
  }
}
</script>

<style scoped>
</style>
