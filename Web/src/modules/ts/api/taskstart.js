'use strict'

import ajax from '@/plugin/ajax.js'

const loadTaskTypeTree = function () {
    return ajax.post('/ts/StartTask/LoadTaskTypeTree')
}
const saveTaskInfo = function (entity) {
    return ajax.post('/ts/StartTask/SaveTaskInfo', entity)
}
const queryTaskInfo = function (
    pageIndex,
    pageSize,
    sortOrder,
    sortField,
    fastSearchFields,
    fastSearchKeyWord,
    isDraft,
    taskTypeId) {
    return ajax.post('/ts/StartTask/QueryTaskInfo',
        {
            pageIndex: pageIndex,
            pageSize: pageSize,
            sortOrder: sortOrder,
            sortField: sortField,
            fastSearchFields: fastSearchFields,
            fastSearchKeyWord: fastSearchKeyWord,
            isDraft: isDraft,
            taskTypeId: taskTypeId
        }
    )
}
const deleteTaskInfo = function (id) {
    return ajax.post('/ts/StartTask/DeleteTaskInfo', { Id: id })
}
const getTaskInfo = function (id) {
    return ajax.post('/ts/StartTask/GetTaskInfo', { Id: id })
}
const getTaskTotalCount = function () {
    return ajax.post('/ts/StartTask/GetTaskTotalCount')
}
export { loadTaskTypeTree, saveTaskInfo, queryTaskInfo, deleteTaskInfo, getTaskInfo, getTaskTotalCount }
