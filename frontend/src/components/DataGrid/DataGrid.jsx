import React, { useState, useEffect } from 'react';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faFilter, faSort } from '@fortawesome/free-solid-svg-icons';
import './DataGrid.scss';

const DataGrid = () => {

    const [ data, setData ] = useState({});
    const [ isLoading, setIsLoading ] = useState(false);
    const [ , setError ] = useState({});
    const [ openModalIdx, setOpenModalIdx ] = useState(-1);

    const [ page, setPage ] = useState(1);
    const [ pageSize, setPageSize ] = useState(10);
    const [ localPageSize, setLocalPageSize ] = useState(pageSize);
    const [ filters, setFilters ] = useState({});
    const [ filterValue, setFilterValue ] = useState({});

    const offset = (page-1) * pageSize;

    useEffect(() => {

        const fetchData = async () => {
            setIsLoading(true);
            try {
                const resp = await fetch(`http://localhost:3000/api/student/getAllDetails?page=${encodeURIComponent(page)}&pageSize=${encodeURIComponent(pageSize)}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({ filters })
                });
                const results = await resp.json();
                if (resp.ok) {
                    if (results.data.length > 0) {
                        const header = Object.keys(results.data[0]);
                        const rows = results.data.map(d => {
                            // for all keys aka columns, format the value
                            // Object.keys(d).forEach(key => {
                            //     d[key] = formatValue(key, d[key]);
                            // });
                            return Object.values(d);
                        });
                        const totalRows = results.totalRows;
    
                        setData({ header, rows, totalRows });
                    } else {
                        setData(prev => ({ ...prev, rows: [] }));
                        throw new Error('No records found');
                    }
                }
                else {
                    throw new Error(results.error);
                }
                setIsLoading(false);
            } catch (err) {
                console.log(err);
                setError({ errorMsg: err });
                setIsLoading(false);
            }
        }

        // fetch grid data
        fetchData();
    }, [page, pageSize, filters]);

    const handleChangePageSize = (e) => {
        e.preventDefault();
        if (localPageSize < 1) {
            setLocalPageSize(1);
        }
        setPageSize(() => {
            setPage(1);
            return localPageSize;
        });
    }

    const handlePageSizeKeyDown = (e) => {  
        if (e.key === 'Enter') {
            handleChangePageSize(e);
        }
    }

    const handleFilterChange = (col, value) => {
        if (!col) return;

        setFilters(prev => {
            setPage(1);
            return { ...prev, [col]: value};
        });
        setOpenModalIdx(-1);
    }

    const handleFilterKeyDown = (e, col, value) => {
        if (e.key === 'Enter') {
            handleFilterChange(col, value);
        }
    }

    const handlePrevPage = () => {
        setPage(prev => {
            if (prev === 1) return 1;
            return prev - 1;
        });
    }

    const handleNextPage = () => {
        setPage(prev => {
            if (prev === Math.ceil(data.totalRows / pageSize)) return prev;
            return prev + 1
        });
    }

    return (
      <>
        {isLoading ? <span className='spinner'></span> : (
          <div className='data-grid'>
            <div className='grid-container'>
              <div className='grid-hdr'>
                {data.header?.map((col, colIdx) => {
                  return (
                    <div key={`${col}-${colIdx}`} className='grid-hdr-cell'>
                      {col}
                      {col !== 'dob' && col !== 'dateofexam' && (
                        <>
                          <span title='filter results' style={{ float: 'right' }} onClick={() => setOpenModalIdx(colIdx)}>
                            <FontAwesomeIcon icon={faFilter} />
                          </span>
                          {openModalIdx === colIdx && (
                            <div className='filter-modal'>
                              <p>Contains</p>
                              <input type='text' id={`${col}-filter`}
                                placeholder='Enter filter value'
                                value={filterValue[col]}
                                onChange={e => setFilterValue(prev => ({ ...prev, [col]: e.target.value }))}
                                onBlur={() => handleFilterChange(col, filterValue[col])}
                                onKeyDown={(e) => handleFilterKeyDown(e, col, filterValue[col])}
                              />
                            </div>
                          )}
                        </>
                      )}
                    </div>
                  )
                })}
              </div>
              <div className='grid-body'>
                {data.rows?.map((row, rowIdx) => (

                  <div key={`${row}-${rowIdx}`} className='grid-row'>

                    {row.map((cell, cellIdx) => (
                      <div key={`${cell}-${cellIdx}`} className='grid-row-cell'>{cell}</div>
                    ))}

                  </div>
                ))}
                <div className='grid-row pagination'>
                  <span>
                    Page Size &nbsp;&nbsp;
                    <input
                      type='number' id='pageSize'
                      value={localPageSize}
                      onChange={(e) => setLocalPageSize(e.target.value)}
                      onBlur={handleChangePageSize}
                      onKeyDown={handlePageSizeKeyDown}
                    />
                  </span>
                  <span>Rows {offset + 1} to {Math.min(offset + parseInt(pageSize), data.totalRows)} shown out of {data.totalRows} </span>
                  <span>
                    <span>
                      <button type='button' className='btn btn-sm'
                        disabled={page === 1}
                        onClick={handlePrevPage}
                      >Prev
                      </button>
                    </span>
                    <span>
                      <input
                        type='number' id='pageNum'
                        value={page}
                        onChange={(e) => setPage(e.target.value)}
                      />
                    </span>
                    <span>
                      <button type='button' className='btn btn-sm'
                        disabled={page >= Math.ceil(data.totalRows / pageSize)}
                        onClick={handleNextPage}
                      >Next
                      </button>
                    </span>
                  </span>
                </div>
              </div>
            </div>
          </div>
        )}
      </>
    );
};

export default DataGrid;