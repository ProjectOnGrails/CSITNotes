package user

import com.CSITNotes.User

class NoteUser {
    String fullName
    Gender gender
    String email
    String phone
    Date dateCreated
    Date lastUpdated
    String createdBy
    String updatedBy
    static enum Gender{
        Male,Female
    }
    static hasOne = [user: User]

    def beforeInsert() {
        dateCreated = new Date()
    }
    def beforeUpdate() {
        lastUpdated = new Date()
    }

    static constraints = {
        fullName nullable: false, blank: false
        email email: true, blank: false
        updatedBy nullable: true
        lastUpdated nullable: true
    }

    static mapping = {
        table 'NoteUser'
    }
}
