package CSIT

import grails.gorm.transactions.Transactional

class NoteController {
    def springSecurityService

    def index(){
        try {
            def semesterId = params.semesterId
            def semester=Semester.findById(semesterId)
            def subjects= semester.subjects
            def notes = []

            // Iterate through each subject and retrieve its associated books
            subjects.each { subject ->
                notes.addAll(subject.notes)
            }
            if (!notes) {
                flash.message = "Notes not found for Semester ID: $semesterId"
            }
            model: [semesterId: semesterId, subjects: subjects, notes: notes]
        } catch (Exception e) {
            flash.message = "Error fetching Notes: ${e.message}"
        }
    }

    def create(){
        def semesterId=params.semesterId
        def semester=Semester.findById(semesterId)
        def subjects= semester.subjects
        render(template: "create",model: [semesterId: semesterId,subjects: subjects])
    }

    def save() {
        try {
            def user = springSecurityService.currentUser
            def semesterId = params.semesterId
            def files = request.getFiles('fileUpload') // Get the list of files
            if (files && !files.isEmpty()) {
                def folderPath = "D:/Grails/Static/Notes"
                def folder = new File(folderPath)
                if (!folder.exists()) {
                    folder.mkdirs() // Create directory including parent directories if they don't exist
                }
                files.each { file ->
                    if (!file.isEmpty()) {
                        def filePath = "${folderPath}/${file.getOriginalFilename()}"
                        file.transferTo(new File(filePath))
                        def noteInstance = new Note(params)
                        noteInstance.fileName = file.getOriginalFilename()
                        noteInstance.fileURL = filePath
                        noteInstance.fileExtension = file.getOriginalFilename().tokenize('.').last()
                        noteInstance.createdBy = user
                        if (noteInstance.save()) {
                            flash.message = "${noteInstance.name} created successfully"
                        } else {
                            flash.error = "Error while creating Note: ${noteInstance.errors}"
                        }
                    }
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

    def getNotes(){
        def subjectId = params.subjectId
        def semesterId=params.semesterId
        if(subjectId==''){
            def semester=Semester.findById(semesterId)
            def subjects= semester.subjects
            def notes = []

            // Iterate through each subject and retrieve its associated books
            subjects.each { subject ->
                notes.addAll(subject.notes)
            }
            render(template: 'show', model: [notes: notes, semesterId: semesterId])
        }
        else {
            def subject = Subject.findById(subjectId)
            def notes = subject.notes
            render(template: 'show', model: [notes: notes,semesterId: semesterId])
        }

    }


    def edit() {
        def noteId = params.noteId
        def semId=params.semId
        def semester=Semester.findById(semId)
        def subjects= semester.subjects
        def noteInstance = Note.findById(noteId)
        render(template: 'edit', model: [noteInstance: noteInstance,subjects: subjects,semesterId:semId])
    }

    def details(){
        def id=params.id
        Note noteInstance=Note.findById(id)
        render(template: 'details',model: [note: noteInstance])
    }

    @Transactional
    def update() {
        try {
            def user = springSecurityService.currentUser
            def semesterId = params.semesterId
            def noteId=params.id
            Note note = Note.findById(noteId)
            if (note) {
                note.properties = params
                note.updatedBy = user
                // Handle file update
                def newFile=params.fileEdit
                if(!newFile.empty){
                    def filePath = "D:/Grails/Static/Notes/${newFile.getOriginalFilename()}"
                    newFile.transferTo(new File(filePath))
                    note.fileName= newFile.getOriginalFilename()
                    note.fileURL = filePath
                    note.fileExtension = newFile.getOriginalFilename().tokenize('.').last()
                }
                if (note.save(flush: true)) {
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
            Note data=Note.findById(params.id)
            if(data) {
                data.delete()
                flash.message = "Data deleted successfully"
            } else {
                flash.message = "Error While Deleting!!"
            }
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }

        catch (Exception e){
            flash.error = "Error while connecting to database: ${e.message}"
            def semesterId = params.semesterId
            redirect(controller:'resource',action: 'index', params: [semesterId: semesterId])
        }

    }

    def downloadFile(Long id) {
        def noteInstance = Note.findById(id)
        if (noteInstance) {
            File file = new File(noteInstance.fileURL)
            if (file.exists()) {
                response.setContentType("application/octet-stream")
                response.setHeader("Content-disposition", "attachment; filename=${noteInstance.fileName}")
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
        def data = Note.findById(id)
        if (data) {
            File file = new File(data.fileURL)
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
