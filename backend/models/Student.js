const { query } = require('../db');

class Student {
    constructor(id, name, grade, dob) {
        this.id = id;
        this.name = name;
        this.age = grade;
        this.dob = dob;
    }
    static getStudentsWithExams = async (filters={}, page=1, pageSize=10, sortBy='id', sortType='ASC') => {
        // TODO: fetch students
        let sql = `
            SELECT s.id as id, s.name, to_char(s.dob, 'DD-MM-YYYY') as dob, e.subject, e.marks, to_char(e.dateofexam::date, 'DD-MM-YYYY') as dateofexam
            FROM student s
            INNER JOIN exam e ON s.id = e.student_id`;

        let sqlCount = `
            SELECT COUNT(*) as totalRows
            FROM student s
            INNER JOIN exam e ON s.id = e.student_id`;

        const params = [];
        let paramIndex = 1;

        console.log('filters:', filters)

        // adding filter criteria
        const filterCols = Object.keys(filters);
        if (filterCols.length > 0) {
            sql += ' WHERE ';
            sqlCount += ' WHERE ';

            filterCols.forEach(filter => {
                // if filter is empty, skip
                if (!filters[filter]) return;2

                // can also use between and <= >= for date range
                if (filter === 'dob' || filter === 'dateofexam') {
                    sql += ` ${filter} = to_date($${paramIndex}, 'DD-MM-YYYY') AND`;
                    sqlCount += ` ${filter} = to_date($${paramIndex}, 'DD-MM-YYYY') AND`;

                    params.push(filters[filter]);
                }

                else if (filter === 'id' || filter === 'marks') {
                    sql += ` ${filter} = $${paramIndex} AND`;
                    sqlCount += ` ${filter} = $${paramIndex} AND`;

                    params.push(filters[filter]);
                }

                else {
                    sql += ` ${filter} ILIKE $${paramIndex} AND`;
                    sqlCount += ` ${filter} ILIKE $${paramIndex} AND`;

                    params.push(`%${filters[filter]}%`);
                }

                
                paramIndex++;
            });

            if (paramIndex === 1) {
                sql = sql.slice(0, -7);
                sqlCount = sqlCount.slice(0, -7);
            } else {
                sql = sql.slice(0, -3);
                sqlCount = sqlCount.slice(0, -3);
            }
        }
        // sorting by column name
        sql += ` ORDER BY $${paramIndex} ${sortType === 'ASC'? 'ASC' : 'DESC'}` 
        params.push(sortBy);

        // adding pagination
        const offset = (page - 1) * pageSize;
        sql += ` LIMIT $${paramIndex+1} OFFSET $${paramIndex+2}`;
        params.push(pageSize, offset);

        try {
            //console.log(sql);
            const { rows } = await query(sql, params);
            const dataCount = await query(sqlCount, params.slice(0, -3));
           // console.log(rows);
            return { rows, totalRows: dataCount.rows[0].totalrows };
        } catch (error) {
            throw new Error(error.message);
        }
    }
    
}

module.exports = Student;