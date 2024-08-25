const Student = require('../models/Student');

const getAllDetails = async (req, res, next) => {
    try {
        const { page, pageSize, sortBy, sortType } = req.query;
        const { filters } = req.body;

        const studentDetails = await Student.getStudentsWithExams(filters, parseInt(page), parseInt(pageSize), sortBy, sortType);
        console.log(studentDetails);
        return res.json({
            success: true,
            message: 'Data returned successfully',
            totalRows: studentDetails.totalRows,
            data: studentDetails.rows
        });
    } catch (err) {
        return res.status(500).json({ error: err.message });
    }
}

module.exports = { getAllDetails }