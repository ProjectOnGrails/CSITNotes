package csitnotes

import com.CSITNotes.Role
import com.CSITNotes.User
import com.CSITNotes.UserRole
import grails.gorm.transactions.Transactional
import user.NoteUser

@Transactional
class SetUpService {

    def startMethod() {
        if(NoteUser.count()==0){

        }
        def roleAdmin= Role.findByAuthority("ROLE_ADMIN")
        if(!roleAdmin){
            roleAdmin=new Role(
                    authority: 'ROLE_ADMIN',
            ).save(failOnError: true,flush:true)
        }
        def userAdmin= User.findByUsername('admin')
        if(!userAdmin){
            userAdmin=new User(
                    username: 'admin',
                    password: 'admin',
            )
        }

        if(NoteUser.count()==0){
            new NoteUser(fullName: 'Shiv Shankar Mahato',gender: NoteUser.Gender.Male,email: 'shiv@gmail.com',phone: '9812345678',createdBy: 'Shiv Shankar', user: userAdmin ).save(failOnError: true,flush:true)
        }

        // Check if the UserRole instance already exists
        def userRole = UserRole.findByUserAndRole(userAdmin, roleAdmin)
        if (!userRole) {
            userRole = new UserRole(user: userAdmin, role: roleAdmin)
            userRole.save(failOnError: true, flush: true)
        }

    }
}
