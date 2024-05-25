package CSIT

import grails.gorm.transactions.Transactional

@Transactional
class SemesterService {

    def getSemesters() {
        def semesters=Semester.list()
        return semesters
    }

    def saveSemester(Semester obj){
        if(obj.save()){
            return  obj
        }
        return false
    }

    def deleteSemester(params){
        Semester data=Semester.findById(params.id)
        if(data){
            data.delete()
            return true
        }
        return  false
    }

    def updateSemester(params,String user){
        def semInstance=Semester.findById(params.id)
        if(semInstance) {
            semInstance.properties = params
            semInstance.updatedBy = user
            // Handle picture update
            def picNew=params.pictureEdit
            if(!picNew.empty){
                semInstance.picture=picNew.getBytes()
            }
            semInstance.save(flush:true)
            return true
        }
        return false
    }

}
