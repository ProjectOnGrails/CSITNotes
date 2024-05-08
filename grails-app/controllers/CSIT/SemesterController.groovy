package CSIT

import grails.gorm.transactions.Transactional

class SemesterController {

    def springSecurityService
    def semesterService

    def index() {
        try{
            def semestersInstance=semesterService.getSemesters()
            if (semestersInstance.isEmpty()) {
                flash.message = "No semesters found in the database."
            }
            [semesters:semestersInstance]
        }
        catch (Exception e){
            flash.message = "Error while connecting to database: ${e.message}"
        }
    }

    def save(){
        try {
            def user = springSecurityService.currentUser
            Semester semInstance=new Semester(params)
            semInstance.createdBy=user
            if(semesterService.saveSemester(semInstance)){
                flash.message = "${semInstance.name} created successfully"
            }else {
                flash.message = "Error while creating Semester: ${semInstance.errors}"
            }
            redirect(view: 'index')
        }
        catch (Exception e){
            flash.message = "Error while connecting to database: ${e.message}"
            redirect(view: 'index')
        }
    }

    @Transactional
    def delete(){
        try{
            if (semesterService.deleteSemester(params)) {
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
        Semester semInstance=Semester.findById(id)
        render(template: 'edit',model: [semester:semInstance])
    }

    @Transactional
    def update(){
        try {
            String user = springSecurityService.currentUser
            if(semesterService.updateSemester(params,user)){
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
