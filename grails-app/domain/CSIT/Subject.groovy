package CSIT

class Subject {
    String code
    String name
    byte[] picture
    String syllabusName
    String syllabusURL
    String description
    Date dateCreated
    Date lastUpdated
    String createdBy
    String updatedBy
    static belongsTo = [semester:Semester]
    static hasMany = [books:Book,notes:Note,questions:Question]
    def beforeInsert() {
        dateCreated = new Date()
    }
    def beforeUpdate() {
        lastUpdated = new Date()
    }

    static constraints = {
        code nullable: false, blank: false
        name nullable: false, blank: false
        description nullable: true
        picture nullable: true, maxSize: 1024 * 1024 * 2 //2MB max size
        syllabusName nullable: false, blank: false
        updatedBy nullable: true
        lastUpdated nullable: true
    }
}
