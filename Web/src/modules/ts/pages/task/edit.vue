<template>
  <div class="ts-task-edit">
    <of-scroll :top="76" :bottom="72">
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">任务基本信息</div>
        </div>
        <!--title-->
        <div class="content-box-form content-box-form-edit form-horizontal">
          <div class="box-form-part">
            <div class="form-group form-required">
              <label class="control-label col-xs-1">任务标题</label>
              <div class="control-box col-xs-11">
                <input class="form-control" v-model="formData.Title" type="text" placeholder="请输入任务标题" />
              </div>
            </div>
            <!--group-->
            <div class="form-group form-required">
              <label class="control-label col-xs-1">详细内容</label>
              <div class="control-box col-xs-11">
                <textarea class="form-control" rows="4" v-model="formData.Content" placeholder="请详细描述任务内容"></textarea>
              </div>
            </div>
            <!--group-->
            <div class="form-group form-required">
              <label class="control-label col-xs-1">任务来源</label>
              <div class="control-box col-xs-11">
                <textarea class="form-control" rows="4" v-model="formData.Source" placeholder="请详细描述任务来源"></textarea>
              </div>
            </div>
            <!--group-->
            <div class="form-group">
              <label class="control-label col-xs-1">是否需要验证</label>
              <div class="control-box col-xs-11">
                <div class="clearfix">
                  <div class="form-radio" @click="formData.IsVerification=0" :class="{selected:formData.IsVerification==0}" name="FormRadio-1"><i></i>不需要</div>
                  <div class="form-radio" @click="formData.IsVerification=1" :class="{selected:formData.IsVerification==1}" name="FormRadio-1"><i></i>需要</div>
                </div>
                <div class="control-note">注：任务申请关闭时是否需要验证</div>
              </div>
            </div>
            <!--group-->
            <div class="form-group" :class="{'form-required':formData.IsVerification===1}">
              <label class="control-label col-xs-1">验证人</label>
              <div class="control-box col-xs-11">
                <div class="form-control-group" @click="onSelectEmployee('Verifier')">
                  <input readonly v-model="formData.VerifierName" class="form-control" type="text" placeholder="请选择验证人">
                  <i class="btn btn-default fa fa-user"></i>
                </div>
              </div>
            </div>
            <!--group-->
          </div>
          <!--part-->
          <div class="box-form-part">
            <div class="row">
              <div class="col-xs-3">
                <div class="form-group form-required">
                  <label class="control-label col-xs-4">任务开始时间</label>
                  <div class="control-box col-xs-8">
                    <el-date-picker type="date" format="yyyy-MM-dd" value-format="yyyy-MM-dd" v-model="formData.BeginDate" placeholder="选择任务开始时间"></el-date-picker>
                    <!-- <div class="form-control-group">
                      <input class="form-control" v-model="formData.BeginDate" type="text" placeholder="" />
                      <i class="btn btn-default fa fa-calendar"></i>
                    </div> -->
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-3">
                <div class="form-group form-required">
                  <label class="control-label col-xs-4">任务结束时间</label>
                  <div class="control-box col-xs-8">
                    <el-date-picker type="date" format="yyyy-MM-dd" value-format="yyyy-MM-dd" v-model="formData.EndDate" placeholder="选择任务结束时间"></el-date-picker>
                    <!--<div class="form-control-group">
                    <input class="form-control" v-model="formData.EndDate" type="text" placeholder="" />
                      <i class="btn btn-default fa fa-calendar"></i> 
                    </div>-->
                  </div>
                </div>
                <!--group-->
              </div>
              <div class="col-xs-6">
                <div class="form-group form-required">
                  <label class="control-label col-xs-2">文件/纪要编号</label>
                  <div class="control-box col-xs-10">
                    <input class="form-control" v-model="formData.SourceFileNo" type="text" placeholder="请输入任务来源的文件名称及编号" />
                  </div>
                </div>
                <!--group-->
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-xs-1">附件</label>
              <div class="control-box col-xs-11">
                <div class="form-attachment">
                  <div class="form-attachment-ctrl clearfix">
                    <of-upload :disabled="uploadingFile" style="display:inline-block" class="upload" @onCheckFile="onCheckUploadFile" accept="*" ref="uploadFile" :action="'/Sys/File/Upload'" @onProgress="()=>{uploadingFile = true}" @onUpLoad="uploadingFileCallback" :showFileList="false">
                      <div slot="content" class="btn btn-primary-outline">
                        {{uploadingFile?'上传中...':'上传附件'}}
                      </div>
                    </of-upload>
                  </div>
                  <ul class="form-attachment-list">
                    <li v-for="(file,index) in attachFiles" :key="index">
                      <i class="icon-office icon-office-doc"></i>
                      <font @click="attachFiles.splice(index, 1)"><i class="fa fa-trash"></i>删除</font>
                      <a target="_blank" :href="file.DownloadUrl">{{file.FileName}}{{file.ExtensionName}}</a>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--part-->
        </div>
        <!--main-->
      </div>
      <!--box-->
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">任务分派信息</div>
        </div>
        <div class="content-box-form content-box-form-edit form-horizontal">
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">任务布置人</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('Assignor')">
                    <input class="form-control" readonly v-model="formData.AssignorName" type="text" placeholder="请输入布置人姓名">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--row-->
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">主办人</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('Host')">
                    <input readonly class="form-control" v-model="formData.HostName" type="text" placeholder="请输入主办人姓名">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">主办部门</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectDepartment('Host')">
                    <input readonly class="form-control" v-model="formData.HostDepartmentName" type="text" placeholder="请选择主办部门">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--row-->
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label class="control-label col-xs-2">协办人</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('assistor')">
                    <input class="form-control" v-model="assistorText" readonly type="text" placeholder="请输入协办人姓名">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                  <div class="control-note">注：协办人可选多个</div>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label class="control-label col-xs-2">协办部门</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectDepartment('assistor')">
                    <input readonly class="form-control" v-model="assistDepartmentText" type="text" placeholder="请选择协办部门">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                  <div class="control-note">注：协办部门可选择多个</div>
                </div>
              </div>
            </div>
          </div>
          <!--row-->
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">任务审批人</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('Approver')">
                    <input class="form-control" readonly v-model="formData.ApproverName" type="text" placeholder="请选择任务审批人">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">督办协调员</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('Coordinator')">
                    <input readonly v-model="formData.CoordinatorName" class="form-control" type="text" placeholder="请选择督办协调员">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--row-->
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">主办分管领导</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('HostLeader')">
                    <input readonly v-model="formData.HostLeaderName" class="form-control" type="text" placeholder="请选择主办分管领导">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group form-required">
                <label class="control-label col-xs-2">督办分管领导</label>
                <div class="control-box col-xs-10">
                  <div class="form-control-group" @click="onSelectEmployee('SuperviseLeader')">
                    <input readonly v-model="formData.SuperviseLeaderName" class="form-control" type="text" placeholder="请选择督办分管领导">
                    <i class="btn btn-default fa fa-user"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--row-->
        </div>
      </div>
      <!--box-->
      <div class="content-box">
        <div class="content-box-title clearfix">
          <div class="box-title-left box-title-text">配置提醒规则</div>
          <div class="box-title-right box-title-btn">
            <i class="fa fa-plus"></i>新增规则
          </div>
        </div>
        <div class="content-table">
          <table cellpadding="0" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">
                  <div class="form-checkbox checkbox-only"><i class="fa fa-check"></i></div>
                </th>
                <th width="10%">名称</th>
                <th width="10%">触发事件</th>
                <th width="30%">提醒内容</th>
                <th width="25%">提醒对象</th>
                <th width="10%">提醒方式</th>
                <th width="10%">操作</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <div class="form-checkbox checkbox-only"><i class="fa fa-check"></i></div>
                </td>
                <td>一级预警</td>
                <td>任务到期前7天</td>
                <td>“任务标题”在“完成期限”即将到期</td>
                <td>代办人</td>
                <td>邮件</td>
                <td>
                  <div class="content-table-ctrl">
                    <a class="ctrl-comfirm">编辑</a>
                    <a class="ctrl-del">删除</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="form-checkbox checkbox-only checked"><i class="fa fa-check"></i></div>
                </td>
                <td>一级预警</td>
                <td>任务到期前7天</td>
                <td>“任务标题”在“完成期限”即将到期</td>
                <td>代办人</td>
                <td>邮件</td>
                <td>
                  <div class="content-table-ctrl">
                    <a class="ctrl-comfirm">编辑</a>
                    <a class="ctrl-del">删除</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="form-checkbox checkbox-only"><i class="fa fa-check"></i></div>
                </td>
                <td>一级预警</td>
                <td>任务到期前7天</td>
                <td>“任务标题”在“完成期限”即将到期</td>
                <td>代办人</td>
                <td>邮件</td>
                <td>
                  <div class="content-table-ctrl">
                    <a class="ctrl-comfirm">编辑</a>
                    <a class="ctrl-del">删除</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="form-checkbox checkbox-only"><i class="fa fa-check"></i></div>
                </td>
                <td>一级预警</td>
                <td>任务到期前7天</td>
                <td>“任务标题”在“完成期限”即将到期</td>
                <td>代办人</td>
                <td>邮件</td>
                <td>
                  <div class="content-table-ctrl">
                    <a class="ctrl-comfirm">编辑</a>
                    <a class="ctrl-del">删除</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="form-checkbox checkbox-only"><i class="fa fa-check"></i></div>
                </td>
                <td>一级预警</td>
                <td>任务到期前7天</td>
                <td>“任务标题”在“完成期限”即将到期</td>
                <td>代办人</td>
                <td>邮件</td>
                <td>
                  <div class="content-table-ctrl">
                    <a class="ctrl-comfirm">编辑</a>
                    <a class="ctrl-del">删除</a>
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="form-checkbox checkbox-only"><i class="fa fa-check"></i></div>
                </td>
                <td>一级预警</td>
                <td>任务到期前7天</td>
                <td>“任务标题”在“完成期限”即将到期</td>
                <td>代办人</td>
                <td>邮件</td>
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
      <!--box-->
    </of-scroll>
    <employee-picker :multiple="selectEmployeeMultiple" @pickerCallBack="onSelectEmployeeCallBack" v-if="selectEmployeeTag"></employee-picker>
    <department-picker :multiple="selectDepartmentMultiple" @pickerCallBack="onSelectDepartmentCallBack" v-if="selectDepartmentTag"></department-picker>
    <div class="form-footer clearfix">
      <button class="btn btn-warning" :disabled="isSaving" @click="onSave(1)">
        {{isSaving?'提交中...':'提交'}}
      </button>
      <button class="btn btn-default" :disabled="isSaving" @click="onSave(0)"> {{isSaving?'保存中...':'保存草稿'}}</button>
    </div>
    <!--footer-->
  </div>
</template>

<script>

import OfScroll from '@/components/controls/of_scroll/of_scroll.vue'
import OfUpload from '@/components/controls/of_upload/of_upload.vue'
import EmployeePicker from '@/modules/sys/components/picker/employee.vue'
import DepartmentPicker from '@/modules/sys/components/picker/department.vue'

import { saveTaskInfo, getTaskInfo } from '@/modules/ts/api/taskstart.js'

export default {
  name: 'ts-task-edit',
  components: {
    OfScroll, OfUpload, EmployeePicker, DepartmentPicker
  },
  data () {
    return {
      isSaving: false,
      uploadingFile: false,
      selectEmployeeTag: null,
      selectEmployeeMultiple: false,
      selectDepartmentTag: null,
      selectDepartmentMultiple: false,
      formData: {
        IsVerification: 1
      },
      attachFiles: [],
      tid: '', // 类型id 
      assistorList: [],
      assistDepartmentList: []
    }
  },
  computed: {
    assistorText () {
      return this.assistorList.map(x => x.AssistorName).join(',')
    },
    assistDepartmentText () {
      return this.assistDepartmentList.map(x => x.AssistDepartmentName).join(',')
    },
  },
  mounted () {
    this.tid = this.$route.query.tid
    const id = this.$route.query.Id
    if (id) this.getTaskInfo(id)
  },
  methods: {
    getTaskInfo (id) {
      getTaskInfo(id).then(x => {
        if (x.data.Code !== 0) {
          this.$message.warning(x.data.Message)
          return
        }
        if (x.data.Data.TaskInfo) {
          this.formData = x.data.Data.TaskInfo;
          this.attachFiles = eval(x.data.Data.TaskInfo.AttachFiles)
        }
        if (x.data.Data.TaskAssistor)
          this.assistorList = x.data.Data.TaskAssistor
        if (x.data.Data.TaskAssistDepartment)
          this.assistDepartmentList = x.data.Data.TaskAssistDepartment
      }).catch(ex => {
        this.$message.error(ex.Message)
      })
    },
    onReset () {
      this.formData = { IsVerification: 1 }
      this.attachFiles = []
      this.assistorList = []
      this.assistDepartmentList = []
    },
    checkForm (obj) {

      if (!obj.Title) { this.$message.warning('请输入任务标题'); return false }
      if (!obj.Content) { this.$message.warning('请输入任务描述内容'); return false }
      if (!obj.Source) { this.$message.warning('请输入任务来源描述'); return false }
      if (obj.IsVerification === 1 && !obj.VerifierId) { this.$message.warning('请选择验证人'); return false }
      if (!obj.BeginDate) { this.$message.warning('请选择任务开始时间'); return false }
      if (!obj.EndDate) { this.$message.warning('请选择任务结束时间'); return false }
      if (!obj.SourceFileNo) { this.$message.warning('请输入任务来源文件编号'); return false }
      if (!obj.AssignorId) { this.$message.warning('请选择任务布置人'); return false }
      if (!obj.HostId) { this.$message.warning('请选择主办人'); return false }
      if (!obj.HostDepartmentId) { this.$message.warning('请选择主办部门'); return false }
      if (!obj.ApproverId) { this.$message.warning('请选择任务审批人'); return false }
      if (!obj.CoordinatorId) { this.$message.warning('请选择督办协调员'); return false }
      if (!obj.HostLeaderId) { this.$message.warning('请选择主办分管领导'); return false }
      if (!obj.SuperviseLeaderId) { this.$message.warning('请选择督办分管领导'); return false }
      return true
    },
    onSave (status) {
      let obj = Object.assign({}, this.formData)
      if (!this.checkForm(obj)) {
        return
      }
      obj.Status = status
      if (status === 1) {
        this.$confirm('确认提交?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.save(obj)
        }).catch(() => {
        });
      } else {
        this.save(obj)
      }
    },
    save (obj) {

      if (this.tid)
        obj.TaskTypeId = this.tid
      obj.AttachFiles = JSON.stringify(this.attachFiles)
      obj.AssistorList = this.assistorList;
      obj.AssistDepartmentList = this.assistDepartmentList
      this.isSaving = true
      saveTaskInfo(obj).then(x => {
        this.isSaving = false
        if (x.data.Code !== 0) {
          this.$message.warning(x.data.Message)
          return
        }
        this.$message.success('提交成功')
        this.onReset()
        // this.$router.back(-1)
      }).catch(ex => {
        this.$message.error(ex.Message)
        this.isSaving = false
      })
    },
    uploadingFileCallback (res) {
      this.uploadingFile = false
      if (res.response.Code !== 0) {
        this.$message.error(res.response.Message)
      } else {
        this.attachFiles.push(res.response.Data)
      }
    },
    onSelectEmployee (tag) {
      this.selectEmployeeMultiple = tag === 'assistor'
      this.selectEmployeeTag = tag
    },
    onSelectEmployeeCallBack (res) {
      if (res) {
        if (this.selectEmployeeTag === 'assistor') {
          this.assistorList = res.map(x => {
            return {
              AssistorId: x.Id,
              AssistorName: x.RealName
            }
          })
        } else {
          this.formData[this.selectEmployeeTag + 'Id'] = res.Id;
          this.formData[this.selectEmployeeTag + 'Name'] = res.RealName;
        }
      }
      this.selectEmployeeTag = null
    },
    onSelectDepartment (tag) {
      this.selectDepartmentMultiple = tag === 'assistor'
      this.selectDepartmentTag = tag
    },
    onSelectDepartmentCallBack (res) {
      if (res) {
        if (this.selectDepartmentTag === 'assistor') {
          this.assistDepartmentList = res.map(x => {
            return {
              AssistDepartmentId: x.id,
              AssistDepartmentName: x.text
            }
          })
        } else {
          this.formData[this.selectDepartmentTag + 'DepartmentId'] = res.id
          this.formData[this.selectDepartmentTag + 'DepartmentName'] = res.text
        }
      }
      this.selectDepartmentTag = null
    },
    onCheckUploadFile () {
    }
  }
}
</script>

<style scoped>
.ts-task-edit >>> input[type="file"] {
  display: none;
}
.el-date-editor.el-input,
.el-date-editor.el-input__inner {
  width: auto;
}
</style>

