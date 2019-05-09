'use strict'

import ajax from '@/plugin/ajax.js'

const loadJsTreeNodes = function () {
    return ajax.post('/Sys/Tenant/LoadJsTreeNodes')
}
const deleteTenant = function (Id) {
    return ajax.post('/Sys/Tenant/Delete', { Id: Id })
}
const saveTenant = function (params) {
    return ajax.post('/Sys/Tenant/Save', params)
}
const newTenant = function (pid, name) {
    return ajax.post('/Sys/Tenant/New', { pid, name })
}
const getTenant = function (Id) {
    return ajax.post('/Sys/Tenant/Get', { Id: Id })
}
const nodeMove = function (Id, pid, ids) {
    return ajax.post('/Sys/Tenant/NodeMove', { Id: Id, pid: pid, ids: ids })
}
export { loadJsTreeNodes, deleteTenant, saveTenant, newTenant, getTenant, nodeMove }
