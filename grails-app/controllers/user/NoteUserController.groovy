package user

import grails.gorm.transactions.Transactional

class NoteUserController {
    def noteUserService
    def springSecurityService
    def index() {
        try{
            def noteUsers=noteUserService.getNoteUser()
            [noteUsers:noteUsers]
        }
        catch (Exception e){
            flash.message="Error while connecting Database ${e.message}"
        }
    }

    def save() {
        try {
            String user = springSecurityService.currentUser
            if(noteUserService.saveNoteUser(params,user)){
                flash.message="${params.fullName} Saved to Database"
            }
            else{
                flash.message="Error while Creating"
            }
            redirect(view:"index")
        }
        catch (Exception e){
            flash.message="Error while connecting Database ${e.message}"
        }
    }

    @Transactional
    def delete(){
        try{
            if (noteUserService.deleteUser(params)) {
                flash.message = "Data deleted successfully"
                redirect(view: 'index')
            } else {
                flash.message = "Error While Deleting!!"
                redirect(view: 'index')
            }
        }
        catch (Exception e){
            flash.error = "Error while connecting to database: ${e.message}"
            redirect(view: 'index')
        }
    }

    def edit(){
        def id=params.id
        NoteUser userInstance=NoteUser.findById(id)
        render(template: 'edit',model: [userInstance:userInstance])
    }

    @Transactional
    def update(){
        try {
            String user = springSecurityService.currentUser
            def userInstance=NoteUser.findById(params.id)
            if(userInstance) {
                userInstance.properties = params
                userInstance.updatedBy = user
                userInstance.save(flush: true)
                flash.message = "Data Updated Successfully!!"
                redirect(view: 'index')
            }
            else{
                flash.message = "Error while Updating!!"
                redirect(view: 'index')
            }
        }
        catch (Exception e){
            flash.message = "Error while connecting to database: ${e.message}"
            redirect(view: 'index')
        }
    }

}
