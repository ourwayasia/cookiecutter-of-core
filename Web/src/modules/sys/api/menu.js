'use strict'

import ajax from '@/plugin/ajax.js'

const loadJsTreeNodes = function () {
    return ajax.post('/Sys/Menu/LoadJsTreeNodes')
}
const deleteMenu = function (Id) {
    return ajax.post('/Sys/Menu/Delete', { Id: Id })
}
const saveMenu = function (params) {
    return ajax.post('/Sys/Menu/Save', params)
}
const newMenu = function (pid, name) {
    return ajax.post('/Sys/Menu/New', { pid, name })
}
const getMenu = function (Id) {
    return ajax.post('/Sys/Menu/Get', { Id })
}
const nodeMove = function (Id, pid, ids) {
    return ajax.post('/Sys/Menu/NodeMove', { Id: Id, pid: pid, ids: ids })
}
export { loadJsTreeNodes, deleteMenu, saveMenu, newMenu, getMenu, nodeMove }
