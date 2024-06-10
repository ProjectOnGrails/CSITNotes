package auth

import com.CSITNotes.Role
import grails.gorm.transactions.Transactional

class RoleController {

    def roleService

    def index() {
        try {
            def roleObj = roleService.getRole()
            if (roleObj) {
                [roles: roleObj]
            } else {
                flash.message = "No data!!"
            }
        }
        catch (e) {
            flash.message = "Error while connecting Database :${e.message}"
        }
    }

    def save() {
        try {
            def role = new Role(params)
            if (roleService.saveRole(role)) {
                flash.message = "${role.authority} created successfully"
            } else {
                flash.message = "Error while creating role"
            }
        }
        catch (e) {
            flash.message = "Error while connecting Database :${e.message}"
        }
        redirect(view: 'index')
    }


    def create(){
        render(template: 'create')
    }

    def edit(){
        def id=params.id
        Role roleInstance=Role.findById(id)
        render(template: 'edit',model: [role:roleInstance])
    }

    @Transactional
    def update() {
        try {
            if(roleService.updateRole(params)){
                flash.message = "Data Updated Successfully!!"
            }
            else{
                flash.message = "Error while Updating!!"
            }
        } catch (Exception e) {
            flash.error = "An error occurred while connecting to database: ${e.message}"
        }
        redirect(action: "index")
    }


    def delete(Long id) {
        try {
            if (roleService.deleteRole(id)) {
                flash.message = "Data deleted successfully"
            } else {
                flash.message = "Error While Deleting!!"
            }
        }
        catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
        }
        redirect action: "index"
    }

}
