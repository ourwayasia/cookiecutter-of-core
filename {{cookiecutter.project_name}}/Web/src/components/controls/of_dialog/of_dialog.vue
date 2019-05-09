<template>
   <el-dialog
    :visible="true"
    :top="top"
    :close-on-click-modal="closeOnClickModel"
    @close="cancel"
    :width="width"
    :fullscreen="fullScreen"
    :append-to-body="appendToBody"
    ref="dialog">
      <span slot="title">{{title}}</span>
      <div class="form-warpper">
        <slot name="content"></slot>
      </div>
      <div slot="footer" class="dialog-footer">
        <slot name="footer-operation">
          <el-button @click.native="cancel" :disabled="isConfirm">{{cancelName}}</el-button>
          <el-button type="primary" @click.native="confirm" :loading="isConfirm">{{confirmName}}</el-button>
        </slot>
    </div>
   </el-dialog>
</template>
<script>
export default {
  name: 'of-dialog',
  props: {
    title: {
      type: String,
      default: ''
    },
    width: {
      type: String,
      default: '50%'
    },
    top: {
      type: String,
      default: '8vh'
    },
    isConfirm: {
      type: Boolean,
      default: false
    },
    fullScreen: {
      type: Boolean,
      default: false
    },
    closeOnClickModel: {
      type: Boolean,
      default: false
    },
    appendToBody: {
      type: Boolean,
      default: false
    },
    cancelName: {
      type: String,
      default: '取 消'
    },
    confirmName: {
      type: String,
      default: '提 交'
    },
    resizeTimeOut: {
      type: Number,
      default: 20
    }
  },
  mounted () {
    setTimeout(() => {
      this.setContentHeight()
      window.addEventListener('resize', () => {
        this.setContentHeight()
      })
    }, this.resizeTimeOut)
  },
  methods: {
    cancel () {
      this.$emit('onCancel')
    },
    confirm () {
      this.$emit('onConfirm')
    },
    setContentHeight () {
      let dialogElement = document.querySelectorAll("div[class='el-dialog']")
      let dialogHeaderElement = document.querySelectorAll("div[class='el-dialog__header']")
      let dialogFooterElement = document.querySelectorAll("div[class='el-dialog__footer']")
      dialogElement = dialogElement[this.appendToBody ? (dialogElement.length - 1) : 0]
      dialogHeaderElement = dialogHeaderElement[this.appendToBody ? (dialogHeaderElement.length - 1) : 0]
      dialogFooterElement = dialogFooterElement[this.appendToBody ? (dialogFooterElement.length - 1) : 0]

      if (dialogElement && dialogHeaderElement && dialogFooterElement) {
        const height = window.innerHeight -
       dialogElement.offsetTop -
       dialogHeaderElement.clientHeight -
       dialogFooterElement.clientHeight - 110
        dialogElement.querySelector('.form-warpper').style.maxHeight = `${height}px`
        this.$emit('onDialogResize', height)
      }
    }
  }
}
</script>
<style scoped>
.form-warpper{
  padding-right: 20px;
  overflow: auto;
}
</style>
