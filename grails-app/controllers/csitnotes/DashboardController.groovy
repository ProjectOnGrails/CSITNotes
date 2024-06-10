package csitnotes

import CSIT.Book
import CSIT.Note
import CSIT.Question
import CSIT.Subject

class DashboardController {

    def index() {
        int subjectCount= Subject.count()
        int noteCount=Note.count()
        int questionCount= Question.count()
        int bookCount= Book.count()
        [subjectCount:subjectCount,noteCount:noteCount,questionCount:questionCount,bookCount:bookCount]
    }
}
