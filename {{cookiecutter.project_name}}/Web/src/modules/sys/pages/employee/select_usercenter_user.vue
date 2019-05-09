<template>
  <of-dialog title="添加用户" width="800px" :appendToBody="true" :isConfirm="isConfirm" @onCancel="cancel(null)" @onConfirm="confirm">
    <div slot="content">
      <of-page mode="list">
        <div slot="toolBar">
          <el-form ref="searchForm" :model="formModel" :rules="formRule" label-width="90px">
            <el-row>
              <el-col :span="20">
                <el-form-item label="关键字" prop="keyword">
                  <el-input @keyup.native.enter="onSearch" v-model="formModel.keyword" size="small" placeholder="请输入员工号、员工姓名、姓名全拼、姓名简拼.." :clearable="true"></el-input>
                </el-form-item>
              </el-col>
              <el-col :span="4" style="line-height:0;">
                <el-button :loading="isloading" style="margin-top:4px;margin-left:25px;" @click="onSearch" type="primary" icon="el-icon-search" size="small">
                  {{isloading?'查询中..':'查询'}}
                </el-button>
              </el-col>
            </el-row>
          </el-form>
        </div>
        <div>
          <el-table v-if="listData.length>0" border ref="tb" highlight-current-row style="width: 100%" header-cell-class-name="header-row" :data="listData" v-loading="isloading" size="small">
            <el-table-column label="员工编号" align="center" prop="empId"></el-table-column>
            <el-table-column label="员工姓名" align="center" prop="empName"></el-table-column>
            <el-table-column label="姓名拼音" align="center" prop="empNamePY"></el-table-column>
            <el-table-column label="部门编号" align="center" prop="deptId"></el-table-column>
            <el-table-column label="部门名称" align="center" prop="deptName"></el-table-column>
            <el-table-column label="操作" width="100" align="center" header-align="center">
              <template slot-scope="scope">
                <el-button v-access:modify @click="onChoose(scope.row)" type="text" size="mini">选择</el-button>
              </template>
            </el-table-column>
          </el-table>
        </div>
      </of-page>
    </div>
    <div slot="footer-operation"></div>
  </of-dialog>
</template>
<script>
import DepartmentPicker from '@/modules/sys/components/picker/department'
import OfDialog from '@/components/controls/of_dialog/of_dialog'
import OfPage from '@/components/base/of_page/of_page'

export default {
  name: 'sys-select-usercenter-user',
  props: {

  },
  data () {
    return {
      isloading: false,
      isConfirm: false,
      dialogVisible: false,
      departmentData: [],
      formModel: {
        keyword: ''
      },
      listData: [],
      formRule: {
        keyword: [
          { required: true, message: '请输入查询关键字', trigger: 'blur' }
        ]
      }
    }
  },
  mounted () {

  },
  components: {
    DepartmentPicker,
    OfDialog,
    OfPage
  },
  methods: {
    cancel (data) {
      this.$emit('formCallBack', data)
    },
    confirm () {

    },
    onSearch () {
      this.$refs['searchForm'].validate(valid => {
        this.isloading = true
        valid && this.getUserByKeywork()
      })
      return false
    },
    getUserByKeywork () {
      this.listData = []
      this.$http.get('/Szyd/UserCenter/GetStaffsByKeyWord?keyword=' + this.formModel.keyword).then(x => {
        this.isloading = false
        if (x.data.Code !== 0) {
          this.$message.error(x.data.Message); return
        }
        this.listData = x.data.Data
      }).catch(ex => {
        this.isloading = false
      })
    },
    onChoose (row) {
      this.getUserDetail(row.empId, arr => {
        if (arr && arr.length > 0) {
          this.cancel(arr[0])
        } else {
          this.$message.error('人员详细信息获取失败')
        }
      })
    },
    getUserDetail (empId, callback) {
      this.$http.get('/Szyd/UserCenter/GetUserInfoByUserId?userId=' + empId).then(x => {
        if (x.data.Code !== 0) {
          this.$message.error(x.data.Message); return
        }
        callback(x.data.Data)
      })
    }
  }
}
</script>

<style scoped>
</style>
