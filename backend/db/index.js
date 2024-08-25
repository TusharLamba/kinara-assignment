const pool = require('./dbPool');


const query = async (text, bindParams) => {
    try {
        const results = await pool.query(text, bindParams);
        return results;
    } catch (err) {
        throw new Error(err.message);
    }
}

module.exports = { query };