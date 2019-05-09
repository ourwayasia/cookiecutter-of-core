
import Vue from 'vue'
import Router from 'vue-router'
import Layout from '@/shared/layout'
import Login from '@/shared/login'
import ModuleRouters from '@/router/modules.js'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      redirect: '/ts/task/list'
    },
    {
      path: '/login',
      name:'Login',
      component: Login,
      meta: {
        needAuth: false
      }
    },
    {
      path: '/layout',
      name: 'Layout',
      component: Layout,
      children: ModuleRouters
    },
    {
      path: '*',
      name: 'any',
      redirect: '/404'
    }
  ]
})

