'use strict'

import ajax from '@/plugin/ajax.js'

const queryPermission = function (pageIndex, pageSize, sortOrder, fastSearchFields, fastSearchKeyWord, SortField, ModuleID) {
    return ajax.post('/Sys/Permission/Query', {
        pageIndex: pageIndex,
        pageSize: pageSize,
        sortOrder: sortOrder,
        fastSearchFields: fastSearchFields,
        fastSearchKeyWord: fastSearchKeyWord,
        SortField: SortField,
        ModuleID: ModuleID
    })
}
const deletePermission = function (Id) {
    return ajax.post('/Sys/Permission/Delete', { Id: Id, })
}
const savePermission = function (model) {
    return ajax.post('/Sys/Permission/Save', model)
}
export { queryPermission, deletePermission, savePermission }
