package auth

import com.CSITNotes.Role
import grails.gorm.transactions.Transactional

@Transactional
class RoleService {

    def getRole() {
        def roles= Role.list()
        return roles
    }

    def saveRole(Role role){
        if(role){
            role.save()
            return  role
        }
        return  false
    }

    def deleteRole(long id){
        def role=Role.get(id)
        if(role){
            role.delete()
            return true
        }
    }

    def updateRole(params) {
        def roleInstance = Role.findById(params.id)
        if(roleInstance){
            roleInstance.properties = params
            roleInstance.save(flush:true)
            return true
        }
        return false
    }


}
