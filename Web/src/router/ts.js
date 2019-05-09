import TaskList from '@/modules/ts/pages/task/list'
import TaskTodo from '@/modules/ts/pages/task/todo'
import TaskToread from '@/modules/ts/pages/task/toread'
import TaskDone from '@/modules/ts/pages/task/done'
import TaskAttention from '@/modules/ts/pages/task/attention'


import TaskBoardIndex from '@/modules/ts/pages/board/index'
import TaskBoardDetail from '@/modules/ts/pages/board/detail'
import TaskBoardSearch from '@/modules/ts/pages/board/search'


import TaskStartIndex from '@/modules/ts/pages/start/index'
import TaskStartList from '@/modules/ts/pages/start/list'
import TaskStartInput from '@/modules/ts/pages/start/input'
import TaskStartDraft from '@/modules/ts/pages/start/draft'
import TaskStartImport from '@/modules/ts/pages/start/import'

import TaskEdit from '@/modules/ts/pages/task/edit'

import TaskType from '@/modules/ts/pages/settings/tasktype'
import TaskAlertrule from '@/modules/ts/pages/settings/alertrule'
import TaskForm from '@/modules/ts/pages/settings/form'
import TaskElement from '@/modules/ts/pages/settings/element'
import TaskEvent from '@/modules/ts/pages/settings/event'

import TaskWfList from '@/modules/ts/pages/workflow/list'
import TaskWfEdit from '@/modules/ts/pages/workflow/edit'



import TaskDetail from '@/modules/ts/pages/task/detail'

let routers = [
    {
        path: '/ts/task/list',
        component: TaskList,
        children: [
            {
                path: '/',
                component: TaskTodo
            },
            {
                path: '/ts/task/todo',
                component: TaskTodo
            },
            {
                path: '/ts/task/toread',
                component: TaskToread
            },
            {
                path: '/ts/task/done',
                component: TaskDone
            },
            {
                path: '/ts/task/attention',
                component: TaskAttention
            }
        ]
    },
    {
        path: '/ts/task/edit',
        component: TaskEdit
    },
    {
        path: '/ts/board/index',
        component: TaskBoardIndex
    },
    {
        path: '/ts/board/detail',
        component: TaskBoardDetail
    },
    {
        path: '/ts/board/search',
        component: TaskBoardSearch
    },
    {
        path: '/ts/task/index',
        component: TaskStartIndex,
        children: [
            {
                path: '/',
                component: TaskStartList
            },
            {
                path: '/ts/start/list',
                component: TaskStartList
            }
            ,
            {
                path: '/ts/start/input',
                component: TaskStartInput
            }
            ,
            {
                path: '/ts/start/draft',
                component: TaskStartDraft
            }
            ,
            {
                path: '/ts/start/import',
                component: TaskStartImport
            }
        ]
    },
    {
        path: '/ts/task/detail',
        component: TaskDetail
    },
    {
        path: '/ts/settings/tasktype',
        component: TaskType
    },
    {
        path: '/ts/settings/alertrule',
        component: TaskAlertrule
    },
    {
        path: '/ts/settings/form',
        component: TaskForm
    },
    {
        path: '/ts/settings/element',
        component: TaskElement
    },
    {
        path: '/ts/settings/event',
        component: TaskEvent
    },
    {
        path: '/ts/wf/list',
        component: TaskWfList
    },
    {
        path: '/ts/wf/edit',
        component: TaskWfEdit
    }
]

export default routers
