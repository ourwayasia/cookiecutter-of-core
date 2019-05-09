<template>
  <div class="signin">
    <div class="header clearfix">
				<a class="logo" href="/">任务督办系统</a>
			</div>
    <!--header-->
    <div class="container">
        <div class="sign_box">
            <div class="sign_box_title">用户登录</div>
            <div class="switchtab">
                <div class="switchtab_main">
                    <div class="switchtab_main_box active" name="list-1">
                        <dl>
                            <dt class="icon_user"></dt>
                            <dd><input type="text" placeholder="请输入账号" v-model="Username" /></dd>
                        </dl>
                        <dl>
                            <dt class="icon_lock"></dt>
                            <dd><input type="password" placeholder="请输入密码" v-model="Password" @keyup.enter="login" /></dd>
                        </dl>
                    </div>
                </div>
                <div class="public_clear">
                    <span class="sign_box_forget showModalMsg">{{ErrorMsg?ErrorMsg:'&nbsp;'}}</span>
                </div>
                <div class="sign_box_footer">
                    <button @click="login" :loading="IsSubmitting">{{ButtonName}}</button>
                </div>
            </div>
        </div>
        <div class="sign_bg">
          <img src="@/assets/images/body_bg.jpg" alt="bg" />
        </div>
    </div>
    <!--container-->
    <div class="footer">
        <div class="footer_content">
            <p>All rights reserved 版权所有：中国广核集团有限公司</p>
        </div>
    </div>
  </div>
</template>

<script>

import {login} from '@/api/authorize.js'

export default {
  name: 'of-login',
  data () {
    return {
      Username: '',
      Password: '',
      IsRemember: false,
      ErrorMsg: '',
      IsSubmitting: false,
      ButtonName: '登 录'
    }
  },
  methods: {
    login () {
      this.ErrorMsg = ''
      if (!this.Username) {
        this.ErrorMsg = '请输入用户名'
        return
      }
      if (!this.Password) {
        this.ErrorMsg = '请输入密码'
        return
      }
      this.IsSubmitting = true
      this.ButtonName = '验证中，请稍候'

      login(this.Username,this.Password).then((rep) => {
        if (rep.data.Code === 0) {
          this.$store.commit('UPDATE_CURRENT_MENUS', rep.data.Data.MenuList)
          this.$store.commit('UPDATE_CURRENT_CONFIG', rep.data.Data.Config)
          this.$store.commit('UPDATE_CURRENT_USERINFO', rep.data.Data.Operator)
          this.$store.commit('UPDATE_CURRENT_PERMISSIONS', rep.data.Data.Permissions)
          this.$store.commit('UPDATE_USERTOKEN', rep.data.Data.UserToken)
          let url = this.$store.getters.GetRedirectUrl
          if (url) {
            this.$router.push(url)
          } else {
            this.$router.push('/')
          }
        } else {
          this.ErrorMsg = rep.data.Message
        }
        this.IsSubmitting = false
        this.ButtonName = '登 录'
      }, (err) => {
        this.ErrorMsg = JSON.stringify(err)
        this.IsSubmitting = false
        this.ButtonName = '登 录'
      })
    }
  }
}
</script>

<style scoped>

</style>
