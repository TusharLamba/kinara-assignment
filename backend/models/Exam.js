const { query } = require('../db');

class Exam {
    constructor(id, subject, marks, dateOfExam) {
        this.id = id;
        this.subject = subject;
        this.marks = marks;
        this.dateOfExam = dateOfExam;
    }
    static getAllExamDetails = async () => {
        try {
            const { rows } = await query('SELECT * FROM exam', []);
            const examDetails = rows.map(row => {
                return new Exam(row.subject, row.marks, row.student_id, row.date_of_exam);
            });
            return examDetails;
        } catch (error) {
            throw new Error(error.message);
        }
    }
}

module.exports = Exam;