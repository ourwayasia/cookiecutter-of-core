import EmployeeList from '@/modules/sys/pages/employee/list'
import DepartmentList from '@/modules/sys/pages/department/list'
import ConfigList from '@/modules/sys/pages/config/list'
import MenuList from '@/modules/sys/pages/menu/list'
import ModuleList from '@/modules/sys/pages/module/list'
import PermissionList from '@/modules/sys/pages/permission/list'
import RoleList from '@/modules/sys/pages/role/list'
import DictionaryList from '@/modules/sys/pages/dictionary/list'
import TenantList from '@/modules/sys/pages/tenant/list'

let routers = [
    {
        path: '/sys/employee/list',
        component: EmployeeList
    },
    {
        name: 'config',
        path: '/sys/config/list',
        component: ConfigList
    },
    {
        path: '/sys/department/list',
        component: DepartmentList
    },
    {
        path: '/sys/menu/list',
        component: MenuList
    },
    {
        path: '/sys/module/list',
        component: ModuleList
    },
    {
        path: '/sys/permission/list',
        component: PermissionList
    },
    {
        path: '/sys/role/list',
        component: RoleList
    },
    {
        path: '/sys/dictionary/list',
        component: DictionaryList
    },
    {
        path: '/sys/tenant/list',
        component: TenantList
    },

    // {
    //   path: '/about',
    //   name: 'about',
    //   // route level code-splitting
    //   // this generates a separate chunk (about.[hash].js) for this route
    //   // which is lazy-loaded when the route is visited.
    //   component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
    // }
]

export default routers
