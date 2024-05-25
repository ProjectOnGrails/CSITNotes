package CSIT

import grails.gorm.transactions.Transactional

class SubjectController {
    def subjectService
    def springSecurityService

    def index() {
        try {
            def semesterId = params.semesterId
            def subjects=subjectService.getSubjects(semesterId)
            if (!subjects) {
                flash.message = "Subjects not found for semester ID: $semesterId"
            }
            model: [semesterId: semesterId,subjects:subjects]
        }
        catch (Exception e) {
            flash.message = "Error fetching subjects: ${e.message}"
        }
    }

    def create(){
        def semesterId=params.semesterId
        render(template: "create",model: [semesterId: semesterId])
    }


    def details(){
        def id=params.id
        Subject subInstance=Subject.findById(id)
        render(template: 'details',model: [subject:subInstance])
    }

    def save() {
        try {
            String user = springSecurityService.currentUser
            def semesterId=params.semesterId
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
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
        catch (Exception e) {
            flash.message = "Error while connecting to database: ${e.message}"
            def semesterId=params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }

    }

    def edit(){
        def semesterId = params.semesterId
        def subjectId=params.id
        Subject subInstance=Subject.findById(subjectId)
        render(template: 'edit',model: [subject:subInstance,semesterId: semesterId])

    }

    @Transactional
    def update() {
        try {
            def semesterId=params.semesterId
            String username = springSecurityService.currentUser
            if (subjectService.updateSubject(params, username)) {
                flash.message = "Data Updated Successfully!!"
            } else {
                flash.error = "Error while Updating!!"
            }
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
        catch (Exception e) {
            flash.message = "Error while connecting to database: ${e.message}"
            def semesterId=params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
    }

    @Transactional
    def delete(){
        try {
            def semesterId=params.semesterId
            if (subjectService.deleteSubject(params)) {
                flash.message = "Data deleted successfully"
            } else {
                flash.message = "Error While Deleting!!"
            }
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
        catch (Exception e){
            flash.message = "Error while connecting to database: ${e.message}"
            def semesterId=params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
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
        }
    }

}
