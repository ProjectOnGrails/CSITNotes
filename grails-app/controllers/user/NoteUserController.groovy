package user

import com.CSITNotes.Role
import com.CSITNotes.User
import com.CSITNotes.UserRole
import grails.gorm.transactions.Transactional

class NoteUserController {
    def noteUserService
    def springSecurityService
    def index() {
        try{
            def noteUsers=noteUserService.getNoteUser()
            model:[noteUsers:noteUsers]
        }
        catch (Exception e){
            flash.message="Error while connecting Database ${e.message}"
        }
    }

    def create(){
        def roles= Role.list()
        render(template: 'create',model: [roles:roles])
    }

    def save() {
        try {
            String currentUser = springSecurityService.currentUser
            if (noteUserService.saveNoteUser(params, currentUser)) {
                flash.message = "NoteUser created successfully."
            } else {
                flash.message = "Error while creating NoteUser."
            }
        } catch (Exception e) {
            flash.message = "Error while connecting Database ${e.message}"
        }
        redirect(view: "index")
    }


    @Transactional
    def delete() {
        try {
            if (noteUserService.deleteUser(params)) {
                flash.message = "NoteUser and associated UserRole deleted successfully."
            } else {
                flash.message = "Error while deleting NoteUser."
            }
        } catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
        }
        redirect(view: "index")
    }


    def edit(){
        def id=params.id
        NoteUser userInstance=NoteUser.findById(id)
        def roles=Role.list()
        render(template: 'edit',model: [userInstance:userInstance,roles: roles])
    }

    def details(){
        def id=params.id
        NoteUser userInstance=NoteUser.findById(id)
        render(template: 'details',model: [userInstance:userInstance])
    }

    def update() {
        try {
            String userLogin = springSecurityService.currentUser
            if (noteUserService.updateUser(params, userLogin)) {
                flash.message = "NoteUser updated successfully."
            } else {
                flash.message = "Error while updating NoteUser."
            }
        } catch (Exception e) {
            flash.message = "Error while connecting to database: ${e.message}"
        }
        redirect(view: 'index')
    }

}
