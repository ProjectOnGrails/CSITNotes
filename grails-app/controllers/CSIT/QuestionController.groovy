package CSIT

import grails.gorm.transactions.Transactional

class QuestionController {
    def springSecurityService

    def index(){
        try {
            def semesterId = params.semesterId
            def semester=Semester.findById(semesterId)
            def subjects= semester.subjects
            if (!subjects) {
                flash.message = "Subjects not found for Semester ID: $semesterId"
            }
            model: [semesterId: semesterId,subjects:subjects]
        } catch (Exception e) {
            flash.message = "Error fetching questions: ${e.message}"
        }
    }

    def create(){
        def semesterId=params.semesterId
        def semester=Semester.findById(semesterId)
        def subjects= semester.subjects
        render(template: "create",model: [semesterId: semesterId,subjects: subjects])
    }

    def save(){
        try {
            def user = springSecurityService.currentUser
            def semesterId = params.semesterId
            def file = request.getFile('fileUpload')
            if (file && !file.isEmpty()) {
                def folderPath = "D:/Grails/Static/Questions"
                def folder = new File(folderPath)
                if (!folder.exists()) {
                    folder.mkdirs()
                }
                def filePath = "${folderPath}/${file.getOriginalFilename()}"
                file.transferTo(new File(filePath))
                def questionInstance=new Question(params)
                questionInstance.fileName=file.getOriginalFilename()
                questionInstance.fileURL=filePath
                questionInstance.createdBy=user
                if (questionInstance.save()) {
                    flash.message = "${questionInstance.name} created successfully"
                } else {
                    flash.error = "Error while creating Subject: ${questionInstance.errors}"
                }
            } else {
                flash.error = "No file selected"
            }
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
        catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
            def semesterId = params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
    }


    def edit() {
        def queId = params.queId
        def semId=params.semId
        def semester=Semester.findById(semId)
        def subjects= semester.subjects
        def questionInstance = Question.findById(queId)
        render(template: 'edit', model: [semesterId:semId, questionInstance: questionInstance,subjects: subjects])
    }

    def details(){
        def id=params.id
        Question questionInstance=Question.findById(id)
        render(template: 'details',model: [question: questionInstance])
    }

    @Transactional
    def update() {
        try {
            def user = springSecurityService.currentUser
            def semesterId = params.semesterId
            Question question = Question.findById(params.id)
            if (question) {
                question.properties = params
                question.updatedBy = user
                // Handle file update
                def newFile=params.fileEdit
                if(!newFile.empty){
                    def filePath = "D:/Grails/Static/Questions/${newFile.getOriginalFilename()}"
                    newFile.transferTo(new File(filePath))
                    question.fileName= newFile.getOriginalFilename()
                    question.fileURL = filePath
                }
                if (question.save(flush: true)) {
                    flash.message = "Data Updated Successfully!!"
                } else {
                    flash.message = "Error while Updating!!"
                }
            } else {
                flash.message = "Data Not Found!!"
            }
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        } catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
            def semesterId = params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }
    }


    @Transactional
    def delete(){
        try {
            def semesterId = params.semesterId
            def queId=params.id
            Question data=Question.findById(queId)
            if (data) {
                data.delete()
                flash.message = "Data deleted successfully"
                redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
            } else {
                flash.message = "Error While Deleting!!"
                redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
            }
        }
        catch (Exception e){
            flash.error = "Error while connecting to database: ${e.message}"
            def semesterId = params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }

    }

    def downloadFile(Long id) {
        def questionInstance = Question.findById(id)
        if (questionInstance) {
            File file = new File(questionInstance.fileURL)
            if (file.exists()) {
                response.setContentType("application/octet-stream")
                response.setHeader("Content-disposition", "attachment; filename=${questionInstance.fileName}")
                response.outputStream << file.bytes
                response.outputStream.flush()
                response.outputStream.close()
            } else {
                flash.error = "File not found"
            }
        }
    }

    def viewFile(Long id) {
        def data = Question.findById(id)
        if (data) {
            File file = new File(data.fileURL)
            if (file.exists()) {
                response.outputStream << file.bytes
                response.outputStream.flush()
                response.outputStream.close()
            } else {
                flash.error = "File not found"
            }
        }
    }

}
