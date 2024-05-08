package user

import grails.gorm.transactions.Transactional

@Transactional
class NoteUserService {

    def getNoteUser() {
        def noteUsers=NoteUser.list()
        return noteUsers
    }
    def saveNoteUser(params,String user){
        def noteUser=new NoteUser(params)
        noteUser.createdBy=user
        if(noteUser){
            noteUser.save()
            return true
        }
        return false
    }

    def deleteUser(params){
        def data=NoteUser.findById(params.id)
        if(data){
            data.delete()
            return true
        }
        return false
    }

    def updateUser(params,String user){
        def userInstance=NoteUser.findById(params.id)
        if(userInstance){
            userInstance.properties=params
            userInstance.updatedBy=user
            userInstance.save(flush:true)
            return true
        }
        return false
    }

}
