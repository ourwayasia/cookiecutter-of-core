'use strict'

import ajax from '@/plugin/ajax.js'

const queryDictionary = function (
    pageIndex,
    pageSize,
    sortOrder,
    fastSearchFields,
    fastSearchKeyWord,
    sortField,
    parentId
) {
    return ajax.post('/Sys/Dictionary/Query', {
        pageSize,
        pageIndex,
        sortOrder,
        fastSearchFields,
        fastSearchKeyWord,
        sortField,
        parentId: parentId
    })
}
const saveDictionary = function (model) {
    return ajax.post('/Sys/Dictionary/Save', model)
}
const deleteDictionary = function (Id) {
    return ajax.post('/Sys/Dictionary/Delete', { Id: Id })
}
const loadJsTreeNodes = function () {
    return ajax.post('/Sys/Dictionary/LoadJsTreeNodes')
}
export { queryDictionary, saveDictionary, deleteDictionary, loadJsTreeNodes }
