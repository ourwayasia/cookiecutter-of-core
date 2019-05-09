'use strict'

import ajax from '@/plugin/ajax.js'

const queryRole = function (pageIndex, pageSize, sortOrder, sortField, fastSearchFields, fastSearchKeyWord) {
    return ajax.post('/Sys/Role/Query', {
        pageSize: pageSize,
        pageIndex: pageIndex,
        sortOrder: sortOrder,
        sortField: sortField,
        fastSearchFields: fastSearchFields,
        fastSearchKeyWord: fastSearchKeyWord
    })
}
const deleteRole = function (Id) {
    return ajax.post('/Sys/Role/Delete', { Id: Id })
}
const saveRole = function (model) {
    return ajax.post('/Sys/Role/Save', model)
}
const loadPermissionTree = function (roleId) {
    return ajax.post('/Sys/Role/LoadJsTreeNodes', { roleId: roleId })
}
const savePermission = function (items, roleId) {
    return ajax.post('/Sys/Role/SavePermission', { items: items, roleId: roleId })
}
const loadRoleMemberData = function (roleId,
    pageIndex,
    pageSize,
    sortOrder,
    fastSearchFields,
    fastSearchKeyWord,
    sortField) {
    return ajax.post('/Sys/Role/LoadRoleMemberData', {
        roleId: roleId,
        pageSize: pageSize,
        pageIndex: pageIndex,
        sortOrder: sortOrder,
        fastSearchFields: fastSearchFields,
        fastSearchKeyWord: fastSearchKeyWord,
        sortField: sortField
    });
}
const deleteRoleMember = function (id) {
    return ajax.post('/Sys/Role/DeleteRoleMember', { Id: id });
}
const saveRoleMember = function (items, roleId) {
    return ajax.post('/Sys/Role/SaveRoleMember', { items: items, roleId: roleId })
}
export { queryRole, deleteRole, saveRole, loadPermissionTree, savePermission, loadRoleMemberData, deleteRoleMember, saveRoleMember }

