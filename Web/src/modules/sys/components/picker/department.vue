<template>
  <of-dialog title="部门选择器" :appendToBody="true" @onCancel="close" @onConfirm="confirm" @onDialogResize="dialogResize" confirmName="确 定" width="45%">
    <div slot="content" style="padding:10px">
      <el-row :gutter="20">
        <el-col :span="14">
          <div class="panel department-nav">
            <header>部门导航</header>
            <div class="content" ref="leftArea">
              <department-tree ref="departmentTree" :multiple="multiple" :checkStrictly="checkStrictly" :showFirstAll="false" :url="departmentUrl" @onCheckChange="checkNode" @onSelectNode="selectNode"></department-tree>
            </div>
          </div>
        </el-col>
        <el-col :span="10">
          <div class="panel options-nav">
            <header>已选项 <span>{{departmentCheckedData.length}}/{{departmentCheckedData.length}}</span></header>
            <div class="content" ref="rightArea">
              <el-checkbox-group v-model="departmentCheckedData" @change="checkedChange">
                <p v-for="item in departmentData" :key="item.id">
                  <el-checkbox :label="item.id" :checked="item.checked">{{item.text}}</el-checkbox>
                </p>
              </el-checkbox-group>
              <p class="no-more" v-show="!departmentCheckedData.length">无数据</p>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </of-dialog>
</template>

<script>
import DepartmentTree from '@/components/controls/of_tree/of_tree'
import OfDialog from '@/components/controls/of_dialog/of_dialog'

export default {
  name: 'sys-department-picker',
  props: {
    multiple: {
      type: Boolean,
      default: false
    },
    checkStrictly: {
      type: Boolean,
      default: false
    },
    checkedData: {
      type: Array,
      default: function () {
        return []
      }
    }
  },
  data () {
    return {
      departmentUrl: '/Sys/Department/LoadJsTreeNodes',
      departmentData: [],
      departmentCheckedData: []
    }
  },
  components: {
    DepartmentTree,
    OfDialog
  },
  mounted () {
    this.checkedData.forEach(x => {
      this.departmentData.push(x)
      this.departmentCheckedData.push(x.id)
    })
  },
  methods: {
    close () {
      this.$emit('pickerCallBack', null)
    },
    confirm () {
      if (this.departmentData.length === 0) {
        this.$message({
          message: '请选择部门',
          type: 'warning'
        })
      } else {
        this.$emit('pickerCallBack', this.multiple ? this.departmentData : this.departmentData[0])
      }
    },
    checkNode (data, checked) {
      if (checked) {
        this.departmentData.push({
          id: data.id,
          text: data.text
        })
        this.departmentCheckedData.push(data.id)
      } else {
        let index = this.departmentData.findIndex(x => x.id === data.id)
        if (index > -1) {
          this.departmentData.splice(index, 1)
        }
        index = this.departmentCheckedData.findIndex(x => x === data.id)
        if (index > -1) {
          this.departmentCheckedData.splice(index, 1)
        }
      }
    },
    checkedChange (items) {
      if (this.multiple) {
        let filterDate = []
        if (items.length > 0) {
          this.departmentData.forEach(x => {
            const index = items.findIndex(f => f === x.id)
            if (index > -1) {
              filterDate.push(x.id)
            }
          })
        }
        this.$refs.departmentTree.$refs.ofTree.setCheckedKeys(filterDate)
      } else {
        this.departmentData = []
        this.departmentCheckedData = []
      }
    },
    selectNode (data, n, e) {
      if (!this.multiple) {
        this.departmentData = []
        this.departmentCheckedData = []
        this.departmentData.push({
          id: data.id,
          text: data.text
        })
        this.departmentCheckedData.push(data.id)
      }
    },
    dialogResize (height) {
      let leftArea = this.$refs.leftArea
      let rightArea = this.$refs.rightArea

      height -= 80
      if (leftArea) {
        leftArea.style.maxHeight = `${height}px`
        leftArea.style.minHeight = `${height}px`
      }
      if (rightArea) {
        rightArea.style.maxHeight = `${height}px`
        rightArea.style.minHeight = `${height}px`
      }
    }
  }
}
</script>
<style scoped>
.panel {
  border: 1px solid #ebeef5;
  overflow: hidden;
  width: 100%;
  border-radius: 3px;
}
.department-nav {
  min-width: 300px;
}
.options-nav {
  min-width: 200px;
}
.panel > header {
  background: #f5f7fa;
  padding: 5px 10px 5px 10px;
  border-bottom: 1px solid #ebeef5;
  position: relative;
}
.panel > header > span {
  position: absolute;
  right: 15px;
  color: #909399;
  font-size: 12px;
  font-weight: 400;
}
.panel > .content {
  padding: 10px;
  overflow: auto;
}
.no-more {
  padding: 5px;
  color: #909399;
  text-align: center;
}
</style>
