<template>
  <el-upload ref="ofUpload" :accept="accept" :action="actionUrl" :show-file-list="showFileList" :on-preview="handlePreview" :on-remove="handleRemove" :on-success="handleSuccess" :on-change="handleChange" :on-progress="handleProgress" :before-upload="handleBefore" :list-type="listType" :disabled="disabled" :file-list="fileList">
    <slot name="content"></slot>
  </el-upload>
</template>
<script>

import appconfig from '@/configs/appConfig.js'

export default {
  name: 'of-upload',
  props: {
    action: {
      type: String,
      default: '/Sys/File/Upload'
    },
    accept: {
      type: String,
      default: '*'
    },
    listType: {
      type: String,
      default: 'text'
    },
    fileList: {
      type: Array,
      default: function () {
        return []
      }
    },
    showFileList: {
      type: Boolean,
      default: true
    },
    disabled: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    actionUrl () {
      return appconfig.ApiPrefix + this.action
    }
  },
  methods: {
    handleRemove (file) {
      this.$emit('onRemove', file)
    },
    handlePreview (file) {
      this.$emit('onPreview', file)
    },
    handleSuccess (res, file) {
      this.$emit('onUpLoad', file)
    },
    handleBefore (file) {
      let uploadStatus = true
      this.$emit('onCheckFile', file, function (status) {
        uploadStatus = status
      })
      return uploadStatus
    },
    handleChange (file, fileList) {
      this.$emit('onChange', fileList)
    },
    handleProgress (event, file, fileList) {
      this.$emit('onProgress', event)
    }
  }
}
</script>
<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px !important;
  height: 178px !important;
  line-height: 178px !important;
  text-align: center;
}
.avatar {
  width: 178px !important;
  height: 178px !important;
  display: block;
}
</style>
