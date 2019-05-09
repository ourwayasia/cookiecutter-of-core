<template>
  <of-page mode="list-form" :leftWidth="360">
    <div slot="leftArea">
      <div class="department-nav">
        <el-row :gutter="10" class="tree-search">
          <el-col :span="11">
            <el-input class="department-search" size="mini" placeholder="输入关键字" v-model="filterText" :disabled="isLoading">
              <i slot="prefix" class="el-input__icon el-icon-search"></i></el-input>
          </el-col>
          <el-col :span="13" style="text-align:right">
            <el-button-group class="btn-oper">
              <el-button v-access:add icon="el-icon-plus" size="mini" @click="add" title="添加根节点" :disabled="isLoading">根节点</el-button>
              <el-button :icon="expandIcon" size="mini" @click="expandAll" :disabled="isLoading">{{expandText}}</el-button>
            </el-button-group>
          </el-col>
        </el-row>
        <el-tree :data="departmentList" ref="departmentTree" draggable v-loading="isLoading" node-key="id" :expand-on-click-node="false" :filter-node-method="filterNode" @node-drop="handleDragEnd" @node-click="selectNode">
          <span class="department-node" slot-scope="{ node, data }">
            <span>{{ data.text }}</span>
            <span class="department-opear" v-show="currentSelectId === data.id">
              <i v-access:add class="el-icon-plus" title="添加子节点" @click.stop="(n) => append(data,node)"></i>
              <i v-access:delete class="el-icon-delete" title="删除节点" @click.stop="(n) => remove(data,node)"></i>
            </span>
          </span>
        </el-tree>
      </div>
    </div>
    <div slot="toolBar">
      <el-button-group class="btn-oper" v-show="deparmentModel.Id">
        <el-button v-access:modify icon="fa fa-save" :disabled="isSave" :loading="isSave" @click="save" size="small"> 保存</el-button>
      </el-button-group>
    </div>
    <div slot="content">
      <div class="department-detail" v-loading="isFormLoading" v-show="deparmentModel.Id">
        <el-form ref="form" :model="deparmentModel" label-width="120px" :rules="editFormRules">
          <el-form-item label="部门编号：" class="form-item">
            <el-input v-model="deparmentModel.No" :disabled="deparmentModel.SourceType != 0 ? true : false" placeholder="请输入部门编号"></el-input>
          </el-form-item>
          <el-form-item label="部门名称：" prop="Name" class="form-item">
            <el-input v-model="deparmentModel.Name" :disabled="deparmentModel.SourceType != 0 ? true : false" placeholder="请输入部门名称"></el-input>
          </el-form-item>
          <el-form-item label="数据来源：" class="form-item">
            <span>{{deparmentModel.SourceType != 0 ? '同步': '录入' }}</span>
          </el-form-item>
          <el-form-item label="状态：" class="form-item">
            <el-switch v-model="deparmentModel.Status" :disabled="deparmentModel.SourceType != 0 ? true : false" :active-value="activeValue" :inactive-value="inactiveValue"></el-switch>
          </el-form-item>
        </el-form>
      </div>
    </div>
  </of-page>
</template>

<script>
import OfPage from '@/components/base/of_page/of_page'
import { loadJsTreeNodes, newDepartment, getDepartment, deleteDepartment, nodeMove, saveDepartment } from '@/modules/sys/api/department.js'


export default {
  name: 'sys-department-list',
  components: {
    OfPage
  },
  data () {
    return {
      departmentList: [],
      deparmentModel: {},
      currentSelectData: {},
      currentSelectId: '',
      activeValue: 1,
      inactiveValue: 0,
      isSave: false,
      isLoading: false,
      isFormLoading: false,
      isExpand: false,
      expandIcon: 'el-icon-sort-down',
      expandText: '展开',
      filterText: '',
      editFormRules: {
        Name: [
          { required: true, message: '请输入部门名称', trigger: 'blur' }
        ]
      }
    }
  },
  mounted () {
    this.loadData()
  },
  watch: {
    filterText (val) {
      this.$refs.departmentTree.filter(val)
    }
  },
  methods: {
    loadData () {
      this.isLoading = true
      loadJsTreeNodes().then((rep) => {
        if (rep.data.Code === 0) {
          this.departmentList = rep.data.Data
        }
        this.isLoading = false
      })
    },
    append (data, n) {
      this.isLoading = true
      this.insertNode(data.id, '').then((rep) => {
        this.isLoading = false
        if (rep.data.Code === 0 && rep.data.Data) {
          const returnData = rep.data.Data
          if (!n.expanded) {
            n.expanded = true
          }
          const newChild = { id: returnData.Id, text: returnData.Name, children: [] }
          if (!data.children) {
            this.$set(data, 'children', [])
          }
          data.children.push(newChild)
          this.$message({
            message: '添加成功',
            type: 'success'
          })
        } else {
          this.$message({
            message: rep.data.Message,
            type: 'error'
          })
        }
      })
    },
    remove (data, node) {
      this.$confirm('确认要删除选中的部门吗？', '系统提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.isLoading = true
        deleteDepartment(data.id).then((rep) => {
          this.isLoading = false
          if (rep.data.Code === 0) {
            const parent = node.parent
            const children = parent.data.children || parent.data
            const index = children.findIndex(d => d.id === data.id)
            children.splice(index, 1)
            this.deparmentModel = {}
            this.$message({
              message: '删除成功',
              type: 'success'
            })
          } else {
            this.$message({
              message: rep.data.Message,
              type: 'error'
            })
          }
        })
      })
    },
    add () {
      // const treeData = this.$refs.departmentTree.getCurrentNode()
      // const node = this.$refs.departmentTree.getNode(treeData)
      // this.append(treeData, node)
      this.isLoading = true
      this.insertNode('', '').then((rep) => {
        this.isLoading = false
        if (rep.data.Code === 0 && rep.data.Data) {
          const returnData = rep.data.Data
          this.departmentList.push({
            id: returnData.Id,
            text: returnData.Name,
            pid: '',
            isEdit: false,
            children: []
          })
          this.$message({
            message: '添加成功',
            type: 'success'
          })
        } else {
          this.$message({
            message: rep.data.Message,
            type: 'error'
          })
        }
      })
    },
    save () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.isSave = true
          let params = Object.assign({}, this.deparmentModel)
          this.currentSelectData.text = this.deparmentModel.Name
          saveDepartment(params).then((rep) => {
            this.isSave = false
            if (rep.data.Code === 0) {
              this.$message({
                message: '保存成功',
                type: 'success'
              })
            } else {
              this.$message({
                message: rep.data.Message,
                type: 'error'
              })
            }
          }).catch((e) => {
            this.isSave = false
            this.$message({
              message: e.toString(),
              type: 'error'
            })
          })
        }
      })
    },
    insertNode (parentId, nodeName) {
      return newDepartment(parentId, nodeName)
    },
    // eslint-disable-next-line
    selectNode (data, n, e) {
      if (!n.expanded) {
        n.expanded = true
      }
      this.currentSelectData = data
      this.currentSelectId = data.id
      this.isFormLoading = true
      getDepartment(data.id).then((rep) => {
        if (rep.data.Code === 0 && rep.data.Data) {
          this.deparmentModel = rep.data.Data
        }
        this.isFormLoading = false
      })
    },
    expandAll () {
      this.isExpand = !this.isExpand
      this.expandIcon = this.isExpand ? 'el-icon-sort-up' : 'el-icon-sort-down'
      this.expandText = this.isExpand ? '收起' : '展开'
      for (var i = 0; i < this.$refs.departmentTree.store._getAllNodes().length; i++) {
        this.$refs.departmentTree.store._getAllNodes()[i].expanded = this.isExpand
      }
    },
    filterNode (value, data) {
      if (!value) return true
      return data.text.indexOf(value) !== -1
    },
    // eslint-disable-next-line
    handleDragEnd (draggingNode, dropTagerNode, dropType, ev) {
      let ids = []
      let parentid = ''
      const id = draggingNode.data.id
      let childrenData = null
      switch (dropType) {
        case 'before':
        case 'after':
          parentid = dropTagerNode.parent.data.id || ''
          childrenData = dropTagerNode.parent.data.children || dropTagerNode.parent.data
          childrenData.forEach(x => {
            ids.push(x.id)
          })
          break
        case 'inner':
          parentid = dropTagerNode.data.id || ''
          childrenData = dropTagerNode.data.children || dropTagerNode.data
          childrenData.forEach(x => {
            ids.push(x.id)
          })
          break
      }
      this.updateMoveNode(id, parentid, ids)
    },
    updateMoveNode (id, pid, ids) {
      this.isLoading = true
      nodeMove(id, pid, ids.join(',')).then((rep) => {
        this.isLoading = false
        if (rep.data.Code === 0) {
          this.$message({
            message: '移动节点成功',
            type: 'success'
          })
        } else {
          this.$message({
            message: rep.data.Message,
            type: 'error'
          })
        }
      })
    },
    setBoxCardHeight () {
      this.boxCardHeight = window.innerHeight - 160
      if (this.$refs.leftBoxCard && this.$refs.mainBoxCard) {
        if (this.$refs.leftBoxCard.$el && this.$refs.mainBoxCard.$el) {
          this.$refs.leftBoxCard.$el.style.height = `${this.boxCardHeight}px`
          this.$refs.mainBoxCard.$el.style.height = `${this.boxCardHeight}px`
        }
      }
    }
  }
}
</script>
<style scoped>
.department-detail > footer {
  text-align: right;
}

.box-card {
  overflow: auto;
}
.department-node {
  font-size: 14px;
  padding-right: 8px;
}
.department-opear {
  position: absolute;
  right: 5px;
}
.department-opear > i:first-child {
  margin-right: 5px;
}
.department-search {
  margin-bottom: 10px;
}
.form-item {
  height: 40px;
}
span {
  color: #606266;
}
</style>
