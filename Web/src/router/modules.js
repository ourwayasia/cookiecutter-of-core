import Page403 from '@/shared/403'
import Page404 from '@/shared/404'
import SysRouter from '@/router/sys.js'
import TsRouter from '@/router/ts.js'

let routers = [
    {
        path: '/403',
        name: 'page-403',
        component: Page403
    },
    {
        path: '/404',
        name: 'page-404',
        component: Page404
    }
]

routers.push.apply(routers, SysRouter)
routers.push.apply(routers, TsRouter)

// routers.push.apply(routers, SzydRouter)

export default routers
