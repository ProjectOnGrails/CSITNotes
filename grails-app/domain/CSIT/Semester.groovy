package CSIT

class Semester {
    int orderNumber
    SemesterName name
    byte[] picture
    Date dateCreated
    Date lastUpdated
    String createdBy
    String updatedBy
    static hasMany = [subjects:Subject]
    static enum SemesterName {
        First, Second, Third, Fourth, Fifth, Sixth, Seventh, Eighth
    }

    def beforeInsert() {
        dateCreated = new Date()
    }
    def beforeUpdate() {
        lastUpdated = new Date()
    }

    static constraints = {
        name nullable: false, blank: false
        orderNumber range: 1..8
        picture nullable: true, maxSize: 1024 * 1024 * 2
        updatedBy nullable: true
        lastUpdated nullable: true
    }
}
