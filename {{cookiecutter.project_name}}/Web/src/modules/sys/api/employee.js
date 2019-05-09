'use strict'

import ajax from '@/plugin/ajax.js'

const queryEmployee = function (
    pageIndex,
    pageSize,
    sortOrder,
    fastSearchFields,
    fastSearchKeyWord,
    departmentId
) {
    return ajax.post('/Sys/Employee/Query', {
        pageSize,
        pageIndex,
        sortOrder,
        fastSearchFields,
        fastSearchKeyWord,
        DepartmentID: departmentId || ''
    })
}
const saveEmployee = function (model) {
    return ajax.post('/Sys/Employee/Save', model)
}
const deleteEmployee = function (Id) {
    return ajax.post('/Sys/Employee/Delete', { Id: Id })
}
const disableOrEnabled = function (Id, status) {
    return ajax.post('/Sys/Employee/DisableOrEnabled', { Id: Id, status: status })
}
export { queryEmployee, saveEmployee, deleteEmployee, disableOrEnabled }
