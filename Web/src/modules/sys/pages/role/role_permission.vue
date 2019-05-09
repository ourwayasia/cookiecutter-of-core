<template>
  <of-dialog :title="formTitle" @onCancel="cancel" @onConfirm="confirm" width="30%" :isConfirm="isConfirm">
    <div slot="content">
      <el-tree ref="tree"
       :data="listData"
       show-checkbox
       node-key="id"
       v-loading="isLoading"
      :default-expanded-keys="checkedKeys"
      :default-checked-keys="checkedKeys">
          <span class="tree-node" slot-scope="{ node, data }">
            <i class="tree-node-icon el-icon-document" v-show="node.isLeaf"></i>
            <i v-show="!node.isLeaf"><img src="@/modules/sys/assets/images/folder.png"/></i>
            <span>{{ data.text }}</span>
          </span>
      </el-tree>
    </div>
  </of-dialog>
</template>

<script>

import OfDialog from '@/components/controls/of_dialog/of_dialog'
import { loadPermissionTree ,savePermission} from '@/modules/sys/api/role.js'

export default {
  name: 'sys-role-permission',
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
      isConfirm: false,
      isLoading: false,
      listData: [],
      icon: 'el-icon-document',
      checkedKeys: []
    }
  },
  components: {
    OfDialog
  },
  mounted () {
    this.loadTreeData()
  },
  methods: {
    loadTreeData () {
      this.isLoading = true
      loadPermissionTree(this.dataForm.Id || '').then((rep) => {
        if (rep.data.Code === 0) {
          this.listData = rep.data.Data.TreeData
          this.checkedKeys = rep.data.Data.PermissionData
        }
        this.isLoading = false
      })
    },
    cancel () {
      this.$emit('formCallBack', null)
    },
    confirm () {
      let checkedIds = []
      this.$refs.tree.getCheckedNodes().forEach(node => {
        if (node.children === null) {
          checkedIds.push({
            RoleId: this.dataForm.Id,
            PermissionId: node.id
          })
        }
      })
      if (checkedIds.length === 0) {
        this.$message({
          message: '请选择权限',
          type: 'error'
        })
        return false
      }
      this.isConfirm = true
      savePermission(checkedIds,this.dataForm.Id).then((rep) => {
        this.isConfirm = false
        if (rep.data.Code === 0) {
          this.$message({
            message: '提交成功',
            type: 'success'
          })
          this.$emit('formCallBack')
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
  }
}
</script>

<style scoped>
.icon-folder{
  background-image: url('/modules/sys/assets/images/folder/png');
  background-repeat: no-repeat;
}
</style>
