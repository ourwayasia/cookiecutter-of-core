import Vue from 'vue'
import Vuex from 'vuex'
import appconfig from '@/configs/appConfig.js'

Vue.use(Vuex)

const state = {
  isLoading: false, // Loading 开关
  currentPath: '', // 当前访问路径
  currentOpenID: '', // 当前OpenID
  userToken: '', // 用户UserToken
  redirectUrl: '', // 用户跳转地址
  currentUserInfo: null, // 当前用户信息
  currentMenus: [], // 当前菜单数据
  currentPermissions: [], // 当前权限数据
  currentConfig: {} // 当前配置
}

let storage = localStorage

export default new Vuex.Store({
  state,
  getters: {
    GetIsLoading () {
      return state.isLoading
    },
    GetUserToken () {
      let r = storage.getItem(appconfig.UserTokenKey)
      if (r) {
        state.userToken = r
      }
      return state.userToken
    },
    GetRedirectUrl () {
      let r = storage.getItem(appconfig.RedirectUrlKey)
      if (r) {
        state.redirectUrl = r
      }
      return state.redirectUrl
    },
    GetCurrentOpenID () {
      let r = storage.getItem(appconfig.CurrentOpenIDKey)
      if (r) {
        state.currentOpenID = r
      }
      return state.currentOpenID
    },
    GetCurrentUserInfo () {
      let r = storage.getItem(appconfig.CurrentUserInfoKey)
      if (r) {
        state.currentUserInfo = JSON.parse(r)
      }
      return state.currentUserInfo
    },
    GetCurrentMenus () {
      let r = storage.getItem(appconfig.CurrentMenusKey)
      if (r) {
        state.currentMenus = JSON.parse(r)
      }
      return state.currentMenus
    },
    GetCurrentPermissions () {
      let r = storage.getItem(appconfig.CurrentPermissionsKey)
      if (r) {
        state.currentPermissions = JSON.parse(r)
      }
      return state.currentPermissions
    },
    GetCurrentConfig () {
      let r = storage.getItem(appconfig.CurrentConfigKey)
      if (r) {
        state.currentConfig = JSON.parse(r)
      }
      return state.currentConfig
    }
  },
  mutations: {
    UPDATE_ISLOADING (state, status) {
      state.isLoading = status
    },
    UPDATE_CURRENT_PATH (state, path) {
      state.currentPath = path
    },
    UPDATE_USERTOKEN (state, userToken) {
      state.userToken = userToken
      storage.setItem(appconfig.UserTokenKey, userToken)
    },
    UPDATE_REDIRECT_URL (state, path) {
      state.redirectUrl = path
      storage.setItem(appconfig.RedirectUrlKey, path)
    },
    UPDATE_CURRENT_OPENID (state, openid) {
      state.currentOpenID = openid
      storage.setItem(appconfig.CurrentOpenIDKey, openid)
    },
    UPDATE_CURRENT_USERINFO (state, userInfo) {
      state.currentUserInfo = userInfo
      storage.setItem(appconfig.CurrentUserInfoKey, JSON.stringify(userInfo))
    },
    UPDATE_CURRENT_MENUS (state, menus) {
      state.currentMenus = menus
      storage.setItem(appconfig.CurrentMenusKey, JSON.stringify(menus))
    },
    UPDATE_CURRENT_PERMISSIONS (state, permissions) {
      state.currentPermissions = permissions
      storage.setItem(appconfig.CurrentPermissionsKey, JSON.stringify(permissions))
    },
    UPDATE_CURRENT_CONFIG (state, config) {
      state.currentConfig = config
      storage.setItem(appconfig.CurrentConfigKey, JSON.stringify(config))
    }
  }
})
