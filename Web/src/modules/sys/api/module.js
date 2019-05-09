'use strict'

import ajax from '@/plugin/ajax.js'

const queryModule = function (pageIndex, pageSize, sortOrder, fastSearchFields, fastSearchKeyWord) {
    return ajax.post('/Sys/Module/Query', {
        pageIndex: pageIndex,
        pageSize: pageSize,
        sortOrder: sortOrder,
        fastSearchFields: fastSearchFields,
        fastSearchKeyWord: fastSearchKeyWord
    })
}
const deleteModule = function (Id) {
    return ajax.post('/Sys/Module/Delete', { Id: Id, })
}
const saveModule = function (model) {
    return ajax.post('/Sys/Module/Save', model)
}
export { queryModule, deleteModule, saveModule }
