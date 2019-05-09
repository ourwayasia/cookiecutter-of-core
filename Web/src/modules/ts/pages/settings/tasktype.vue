
<template>
  <div class="content-box content-taskbox">
    <div class="content-taskbox-menu">
      <div class="content-box-title no-border">
        <div class="box-title-text">配置任务</div>
      </div>
      <!--title-->
      <div class="clearfix">
        <div class="borderbox-title-ctrl">
          <div class="borderbox-title-ctrl-search">
            <input class="form-control" type="text" placeholder="请输入标题关键字">
            <i class="fa fa-search"></i>
          </div>
        </div>
      </div>
      <!--search taskTypeTreeData -->
      <div class="menu-sub">
        <template v-for="(item,index) in taskTypeTreeData">
          <dl class="menu-sub-list" :class="{active:item.active}" :key="index">
            <dt><a @click="onEditParentTaskType(item)">{{item.text}}</a></dt>
            <dd v-if="item.children&&item.children.length>0">
              <a :class="{active:childitem.id===formData.Id}" v-for="(childitem,i) in item.children" @click="onEditTaskType(childitem)" :key="i">
                <span>{{childitem.text}}</span>
                <!-- <div class="menu-move-popover">
                  <ul>
                    <li>
                      <i class="fa fa-long-arrow-up btn btn-default"></i>
                    </li>
                    <li>
                      <i class="fa fa-long-arrow-down btn btn-default"></i>
                    </li>
                    <li>
                      <i class="fa fa-trash btn btn-default"></i>
                    </li>
                  </ul>
                </div> -->
              </a>
            </dd>
          </dl>
        </template>
      </div>
      <!--menu-->
      <div class="content-taskbox-btn">
        <button type="button" class=" btn btn-default" :disabled="isSaving" @click="onAddNew"><i class="fa fa-plus"></i>新增任务</button>
      </div>
      <!--btn-->
    </div>
    <!--menu-->
    <div class="content-taskbox-main">
      <div class="content-borderbox-top clearfix">
        <div class="content-tab">
          <a href="javascript:void(0)" :class="{active:currentTab=='info'}" @click="currentTab='info'">基本信息</a>
          <a href="javascript:void(0)" :class="{active:currentTab=='form'}" @click="currentTab='form'">表单</a>
          <a href="javascript:void(0)" :class="{active:currentTab=='flow'}" @click="currentTab='flow'">流程</a>
          <a href="javascript:void(0)" :class="{active:currentTab=='rule'}" @click="currentTab='rule'">提醒规则</a>
        </div>
      </div>
      <div class="content-box-form content-box-form-edit form-horizontal" v-if="currentTab=='info'">
        <div class="box-form-part">
          <div class="form-group">
            <label class="control-label col-xs-2">任务类型名称</label>
            <div class="control-box col-xs-10">
              <input class="form-control" type="text" v-model="formData.Name" placeholder="请输入任务类型名称">
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">任务类型代码</label>
            <div class="control-box col-xs-10">
              <input class="form-control" type="text" v-model="formData.Code" placeholder="请输入任务类型代码">
            </div>
          </div>
        </div>
        <div class="box-form-part">
          <div class="form-group">
            <label class="control-label col-xs-2">父类任务</label>
            <div class="control-box col-xs-10">
              <select class="form-control" v-model="formData.ParentId" placeholder="请选择父类任务">
                <option v-for="(item,index) in parentTaskType" :value="item.Id" :key="index">{{item.Name}}</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">状态</label>
            <div class="control-box col-xs-10">
              <div class="clearfix">
                <div class="form-radio" :class="{selected:formData.Status === 1}" name="FormRadio-1" @click="formData.Status = 1"><i></i>启用</div>
                <div class="form-radio" :class="{selected:formData.Status === 0}" name="FormRadio-1" @click="formData.Status = 0"><i></i>禁用</div>
              </div>
            </div>
          </div>
        </div>
        <div class="box-form-part">
          <div class="form-group">
            <label class="control-label col-xs-2"></label>
            <div class="control-box col-xs-10">
              <button type="button" class="btn btn-warning" :disabled="isSaving" @click="onSave">
                {{isSaving?'保存中...':'确定'}}
              </button>
              <button type="button" class="btn btn-default" :disabled="isSaving">取消</button>
            </div>
          </div>
        </div>
      </div>
      <div class="content-box-form content-box-form-edit form-horizontal" v-if="currentTab=='form'">
        <div class="box-form-part">
          <div class="form-group">
            <label class="control-label col-xs-2">父类任务</label>
            <div class="control-box col-xs-10">
              <select class="form-control">
                <option>表单1</option>
                <option>表单2</option>
                <option>表单3</option>
              </select>
            </div>
          </div>
        </div>
        <div class="box-form-part">
          <div class="form-group">
            <label class="control-label col-xs-2"></label>
            <div class="control-box col-xs-10">
              <div class="btn btn-warning">确定</div>
              <div class="btn btn-default">取消</div>
            </div>
          </div>
        </div>
      </div>
      <div class="content-box-form content-box-form-edit form-horizontal" v-if="currentTab=='flow'">
        <div class="box-form-part">
          <div class="form-group">
            <label class="control-label col-xs-2">任务申请流程</label>
            <div class="control-box col-xs-10">
              <select class="form-control">
                <option>item1</option>
                <option>item2</option>
                <option>item3</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">任务延期流程</label>
            <div class="control-box col-xs-10">
              <select class="form-control">
                <option>item1</option>
                <option>item2</option>
                <option>item3</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2">任务关闭流程</label>
            <div class="control-box col-xs-10">
              <select class="form-control">
                <option>item1</option>
                <option>item2</option>
                <option>item3</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label col-xs-2"></label>
            <div class="control-box col-xs-10">
              <div class="btn btn-warning">确定</div>
              <div class="btn btn-default">取消</div>
            </div>
          </div>
        </div>
      </div>
      <div v-if="currentTab=='rule'">
        <div class="content-taskbox-searchbar clearfix">
          <div class="btn btn-default"><i class="fa fa-plus"></i>新增规则</div>
        </div>
        <div class="content-table">
          <table cellpadding="0" cellspacing="0">
            <thead>
              <tr>
                <th width="30%">名称</th>
                <th width="50%">类型</th>
                <th width="20%">操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>一级预警</td>
                <td>任务即将到期系统通知</td>
                <td>
                  <div class="content-table-ctrl">
                    <a class="ctrl-comfirm">编辑</a>
                    <a class="ctrl-del">删除</a>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import { saveTaskType, loadTaskTypeByParentId, loadTaskTypeTree, getTaskType } from '@/modules/ts/api/settings.js'

export default {
  data () {
    return {
      currentTab: 'info',
      formData: {
        Status: 1
      },
      isSaving: false,
      parentTaskType: [],
      taskTypeTreeData: []
    }
  },
  mounted () {
    this.loadTopTaskType()
    this.loadTaskTypeTree()
  },
  methods: {
    loadTaskTypeTree () {
      loadTaskTypeTree().then(x => {
        if (x.data.Code !== 0) {
          this.$message.error(x.data.Message)
          return
        }
        if (x.data.Data) {
          x.data.Data.map(v => {
            v.active = false;
          })
          this.taskTypeTreeData = x.data.Data;
        }
      })
    },
    loadTopTaskType () {
      loadTaskTypeByParentId('').then(x => {
        this.parentTaskType = x.data.Data
      })
    },
    onEditParentTaskType (item) {
      item.active = !item.active
      this.onEditTaskType(item)
    },
    onEditTaskType (item) {
      getTaskType(item.id).then(x => {
        this.formData = x.data.Data
      })

    },
    onAddNew () {
      this.formData = {
        Status: 1
      }
    },
    onSave () {
      let model = Object.assign({}, this.formData)
      this.isSaving = true
      saveTaskType(model).then(x => {
        this.isSaving = false
        if (x.data.Code !== 0) {
          this.$message.error(x.data.Message)
          return
        }
        this.$message.success('保存成功！')
        if (!model.ParentId)
          this.loadTopTaskType()
        this.loadTaskTypeTree()
        this.onAddNew()
      }).catch(() => {
        this.isSaving = false
      })
    }
  }
}
</script>

<style scoped>
</style>

