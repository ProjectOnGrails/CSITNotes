package csitnotes


import CSIT.Note
import CSIT.Question
import CSIT.Subject
import user.NoteUser


class DashboardController {

    def index() {
        [subjectCount:Subject.count(), noteCount: Note.count(), questionCount:Question.count(),userCount: NoteUser.count()]
    }
}
