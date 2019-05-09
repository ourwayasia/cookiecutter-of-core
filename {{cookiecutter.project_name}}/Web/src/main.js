'use strict'

import Vue from 'vue'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

import App from './App.vue'
import router from './router'

import MixinPlugin from '@/plugin/mixin'

import store from './store'
import i18n from './i18n'

Vue.use(ElementUI)
Vue.use(MixinPlugin)

Vue.config.productionTip = false

Vue.prototype.$bus = new Vue();

// eslint-disable-next-line
router.beforeEach((to, from, next) => {
  store.commit('UPDATE_ISLOADING', true)
  if (to.path !== '/' && to.path !== '/login') {
    let userToken = store.getters.GetUserToken
    if (!userToken) {
      store.commit('UPDATE_REDIRECT_URL', to.path)
      next({ path: '/login' })
    }
  }
  next()
})

// eslint-disable-next-line
router.afterEach((to, from) => {
  store.commit('UPDATE_CURRENT_PATH', to.path.toLowerCase())
  if (document && to.meta.title) {
    document.title = to.meta.title
  }
  store.commit('UPDATE_ISLOADING', false)
})

new Vue({
  router,
  store,
  i18n,
  render: h => h(App)
}).$mount('#app')
