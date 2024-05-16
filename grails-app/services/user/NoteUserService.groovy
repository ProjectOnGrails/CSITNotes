package user

import com.CSITNotes.Role
import com.CSITNotes.User
import com.CSITNotes.UserRole
import grails.gorm.transactions.Transactional

@Transactional
class NoteUserService {

    def getNoteUser() {
        def noteUsers=NoteUser.list()
        return noteUsers
    }

    def saveNoteUser(params, String user) {
        def noteUser = new NoteUser(params)
        noteUser.createdBy = user
        def userName = params.user.username
        def existingUser = User.findByUsername(userName)
        if (!existingUser) {
            if (noteUser.save(failOnError: true, flush: true)) {
                def roleAuthority = params.roleAuthority
                def role = Role.findByAuthority(roleAuthority)
                if (user && role) {
                    def userRole = UserRole.findByUser(noteUser.user)
                    if (!userRole) {
                        userRole = new UserRole(user: noteUser.user, role: role)
                        userRole.save(failOnError: true, flush: true)
                        return true
                    }
                }
            }
            return false
        }
        return false
    }

    def deleteUser(params) {
        def noteUser = NoteUser.findById(params.id)
        if (noteUser) {
            def userRole = UserRole.findByUser(noteUser.user)
            if (userRole) {
                userRole.delete(flush: true)
            }
            noteUser.delete(flush: true)
            return true
        }
        return false
    }

    def updateUser(params, String user) {
        def noteUser = NoteUser.findById(params.id)
        if (noteUser) {
            noteUser.properties = params
            noteUser.updatedBy = user
            noteUser.save(flush: true)
            def roleId = params.newRoleId
            def newRole = Role.get(roleId)
            if (newRole) {
                def userRole = UserRole.findByUser(noteUser.user)
                if (userRole) {
                    userRole.delete(flush: true)
                    def newUserRole = new UserRole(user: noteUser.user, role: newRole)
                    newUserRole.save(flush: true, failOnError: true)
                    return true
                }
            }
        }
        return false
    }

}
