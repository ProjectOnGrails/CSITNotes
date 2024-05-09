package CSIT

import grails.gorm.transactions.Transactional

class SubjectController {
    def subjectService
    def springSecurityService

    def index() {
        try{
            def semesters=subjectService.getSemesters()
            if (!semesters) {
                flash.message = "No semesters found in the database."
            }
            model: [semesters:semesters]
        }
        catch (Exception e){
            flash.error = "Error while connecting to database: ${e.message}"
        }

    }

    def getSubjects(){
        try {
            def semesterId = params.semesterId
            def subjects=subjectService.getSubjects(semesterId)
            if (!subjects) {
                flash.message = "Subjects not found for semester ID: $semesterId"
            }
            render(template: 'show', model: [subjects: subjects])
        } catch (Exception e) {
            flash.message = "Error fetching subjects: ${e.message}"
        }
    }

    def details(){
        def id=params.id
        Subject subInstance=Subject.findById(id)
        render(template: 'details',model: [subject:subInstance])
    }

    def save() {
        try {
            String user = springSecurityService.currentUser
            def file = request.getFile('fileUpload')
            if (file && !file.isEmpty()) {
                def saveResult = subjectService.saveSubject(params, file, user)
                if (saveResult) {
                    flash.message = "${saveResult.name} created successfully"
                } else {
                    flash.message = "Error while creating Subject: ${saveResult.errors}"
                }
            }
            else {
                flash.message = "No file selected"
            }

        } catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
        }
        redirect(action: "index")
    }

    def edit(){
        def id=params.id
        def semesters=Semester.findAll()
        Subject subInstance=Subject.findById(id)
        render(template: 'edit',model: [subject:subInstance,semesters: semesters])

    }

    @Transactional
    def update() {
        try {
            String username = springSecurityService.currentUser
            if (subjectService.updateSubject(params, username)) {
                flash.message = "Data Updated Successfully!!"
            } else {
                flash.error = "Error while Updating!!"
            }
        } catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
        }
        redirect(action: 'index')
    }

    @Transactional
    def delete(){
        try {
            if (subjectService.deleteSubject(params)) {
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

    def showPicture(Long id){
        def sub=Subject.get(id)
        response.outputStream << sub.picture
        response.outputStream.flush()
        response.outputStream.close()
    }


    def downloadFile(Long id) {
        def data = Subject.get(id)
        if (data) {
            File file = new File(data.syllabusURL)
            if (file.exists()) {
                response.setContentType("application/octet-stream")
                response.setHeader("Content-disposition", "attachment; filename=${data.syllabusName}")
                response.outputStream << file.bytes
                response.outputStream.flush()
                response.outputStream.close()
            } else {
                flash.error = "File not found"
                redirect(action: "index")
            }
        } else {
            flash.error = "Book not found"
            redirect(action: "index")
        }
    }

    def viewFile(Long id) {
        def data = Subject.get(id)
        if (data) {
            File file = new File(data.syllabusURL)
            if (file.exists()) {
                response.outputStream << file.bytes
                response.outputStream.flush()
                response.outputStream.close()
            } else {
                flash.error = "File not found"
                redirect(action: "index")
            }
        } else {
            flash.error = "Book not found"
            redirect(action: "index")
        }
    }

}
