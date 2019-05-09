'use strict'

import store from '@/store'

const directives = {
  access: {
    // 权限控制指令
    bind (el, binding, vnode) {
      if (!binding.arg) { return }
      let menus = store.getters.GetCurrentMenus
      let permissions = store.getters.GetCurrentPermissions
      let path = vnode.context.$route.path
      if (!path) { return }
      let node = menus.find(item => {
        return item && item.MenuUrl && path && item.MenuUrl.toLowerCase() === path.toLowerCase()
      })
      if (!node) { return }
      let moduleKey = node.ModuleKey
      let access = permissions.find(item => {
        return item && item.ModuleKey && moduleKey && item.Operation && item.ModuleKey.toLowerCase() === moduleKey.toLowerCase() && item.Operation.toLowerCase() === binding.arg.toLowerCase()
      })
      if (!access) { return }
      if (!access.HasAccess) { el.style.display = 'none' }
    }
  }
}

export default directives
