package CSIT

import grails.gorm.transactions.Transactional

@Transactional
class SubjectService {

    def getSemesters() {
        return Semester.list()
    }
    def getSubjects(semesterId){
        def semester = Semester.findById(semesterId)
        def subjects =semester.subjects
        return subjects
    }

    def saveSubject(params, def file, String user) {
        def folderPath = "D:/Grails/Static/Syllabus"
        def folder = new File(folderPath)
        if (!folder.exists()) {
            folder.mkdirs() // Create directory including parent directories if they don't exist
        }
        def filePath = "${folderPath}/${file.getOriginalFilename()}"
        file.transferTo(new File(filePath))
        Subject subjectInstance = new Subject(params)
        subjectInstance.syllabusName = file.getOriginalFilename()
        subjectInstance.syllabusURL = filePath
        subjectInstance.createdBy = user
        if (subjectInstance.save()) {
            return subjectInstance
        } else {
            return false
        }
    }

    def deleteSubject(params) {
        def subject = Subject.findById(params.id)
        if (subject) {
            subject.delete()
            return true
        }
        return false
    }

    def updateSubject(params, String username) {
        def subject = Subject.get(params.id)
        if (subject) {
            subject.properties = params
            subject.updatedBy = username
            // Handle picture update
            def picNew=params.pictureEdit
            if(!picNew.empty){
                subject.picture=picNew.getBytes()
            }
            def newFile = params.fileEdit
            if (!newFile.empty) {
                def filePath = "D:/Grails/Static/Syllabus/${newFile.getOriginalFilename()}"
                newFile.transferTo(new File(filePath))
                subject.syllabusName = newFile.getOriginalFilename()
                subject.syllabusURL = filePath
            }
            if (subject.save(flush: true)) {
                return true
            }
            return false
        }
    }
}
