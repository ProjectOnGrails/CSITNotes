package CSIT

class Question {
    String name
    String fileName
    int year
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
        year nullable: false
        updatedBy nullable: true
        lastUpdated nullable: true
    }
}
