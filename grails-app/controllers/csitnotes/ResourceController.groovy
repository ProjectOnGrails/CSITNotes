package csitnotes

import CSIT.Semester

class ResourceController {

    def index() {
        def semesterId = params.semesterId
        def semester=Semester.findById(semesterId)
        def subjects= semester.subjects
        [semesterId:semesterId,subjects:subjects]
    }

}
