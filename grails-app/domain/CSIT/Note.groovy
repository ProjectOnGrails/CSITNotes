package CSIT

class Note {
    String name
    String fileName
    String fileExtension
    String fileURL
    Date dateCreated
    Date lastUpdated
    String createdBy
    String updatedBy
    static belongsTo = [subject:Subject]
    def beforeInsert() {
        dateCreated = new Date()
    }
    def beforeUpdate() {
        lastUpdated = new Date()
    }

    static constraints = {
        name nullable: false, blank: false
        fileName nullable: false, blank: false
        updatedBy nullable: true
        lastUpdated nullable: true
    }
}
