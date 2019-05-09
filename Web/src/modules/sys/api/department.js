'use strict'

import ajax from '@/plugin/ajax.js'

const loadJsTreeNodes = function () {
    return ajax.post('/Sys/Department/LoadJsTreeNodes')
}
const newDepartment = function (pid, name) {
    return ajax.post('/Sys/Department/New', { pid, name })
}
const getDepartment = function (Id) {
    return ajax.post('/Sys/Department/Get', { Id })
}
const deleteDepartment = function (Id) {
    return ajax.post('/Sys/Department/Delete', { Id })
}
const nodeMove = function (Id, pid, ids) {
    return ajax.post('/Sys/Department/NodeMove', { Id: Id, pid: pid, ids: ids })
}
const saveDepartment = function (model) {
    return ajax.post('/Sys/Department/Save', model)
}

export { loadJsTreeNodes, newDepartment, getDepartment, deleteDepartment, nodeMove, saveDepartment }
