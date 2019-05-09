'use strict'

import ajax from '@/plugin/ajax.js'

const saveTaskType = function (model) {
    return ajax.post('/ts/Settings/SaveTaskType', model)
}
const loadTaskTypeByParentId = function (pid) {
    return ajax.post('/ts/Settings/GetTaskTypeByParentId', pid)
}
const loadTaskTypeTree = function () {
    return ajax.post('/ts/Settings/LoadTaskTypeTree')
}
const getTaskType = function (id) {
    return ajax.post('/ts/Settings/GetTaskType', { Id: id })
}
export { saveTaskType, loadTaskTypeByParentId, loadTaskTypeTree, getTaskType }
