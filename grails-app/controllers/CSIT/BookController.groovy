package CSIT

import grails.gorm.transactions.Transactional

class BookController {
    def springSecurityService

    def index() {
        def semesters=Semester.list()
        model: [semesters:semesters]
    }

    def getSubjects() {
        def id=params.id
        def semester=Semester.findById(id)
        def subjects= semester.subjects
        // Render a partial view containing options for subjects dropdown
        render(template: '/shared/subjectOptions', model: [subjects: subjects])
    }

    def getBooks(){
        def semesterId = params.semesterId
        def semester = Semester.get(semesterId)
        // Retrieve all subjects associated with the semester
        def subjects = semester.subjects

        // Initialize an empty list to store books
        def allBooks = []

        // Iterate through each subject and retrieve its associated books
        subjects.each { subject ->
            allBooks.addAll(subject.books)
        }
        render(template: 'show',model: [books:allBooks])
    }

    def save(){
        try {
            def user = springSecurityService.currentUser
            def file = request.getFile('fileUpload')
            if (file && !file.isEmpty()) {
                def folderPath = "D:/Grails/Static/Book"
                def folder = new File(folderPath)
                if (!folder.exists()) {
                    folder.mkdirs() // Create directory including parent directories if they don't exist
                }
                def filePath = "${folderPath}/${file.getOriginalFilename()}"
                file.transferTo(new File(filePath))
                def bookInstance=new Book(params)
                bookInstance.fileName=file.getOriginalFilename()
                bookInstance.fileURL=filePath
                bookInstance.createdBy=user
                if (bookInstance.save()) {
                    flash.message = "${bookInstance.name} created successfully"
                } else {
                    flash.error = "Error while creating Subject: ${bookInstance.errors}"
                }
            } else {
                flash.error = "No file selected"
            }
            redirect(view: 'index')
        }
        catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
            redirect(view: 'index')
        }
    }

    def edit() {
        def id = params.id
        def bookInstance = Book.get(id)
        def semesters = Semester.list()
        render(template: 'edit', model: [bookInstance: bookInstance, semesters: semesters])
    }

    @Transactional
    def update() {
        try {
            def user = springSecurityService.currentUser
            Book bookInstance = Book.findById(params.id)
            if (bookInstance) {
                bookInstance.properties = params
                bookInstance.updatedBy = user
                // Handle file update
                def newFile=params.fileEdit
                if(!newFile.empty){
                    def filePath = "D:/Grails/Static/Book/${newFile.getOriginalFilename()}"
                    newFile.transferTo(new File(filePath))
                    bookInstance.fileName= newFile.getOriginalFilename()
                    bookInstance.fileURL = filePath
                }
                if (bookInstance.save(flush: true)) {
                    flash.message = "Data Updated Successfully!!"
                } else {
                    flash.message = "Error while Updating!!"
                }
            } else {
                flash.message = "Data Not Found!!"
            }
            redirect(view: 'index')
        } catch (Exception e) {
            flash.error = "Error while connecting to database: ${e.message}"
            redirect(view: 'index')
        }
    }

    @Transactional
    def delete(){
        try {
            Book data=Book.findById(params.id)
            if (data) {
                data.delete()
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

    def downloadFile(Long id) {
        def bookInstance = Book.get(id)
        if (bookInstance) {
            File file = new File(bookInstance.fileURL)
            if (file.exists()) {
                response.setContentType("application/octet-stream")
                response.setHeader("Content-disposition", "attachment; filename=${bookInstance.fileName}")
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
        def data = Book.get(id)
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
        } else {
            flash.error = "Book not found"
            redirect(action: "index")
        }
    }

}
