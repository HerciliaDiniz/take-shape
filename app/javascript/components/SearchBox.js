import React from 'react'

const SearchBox = ({ searchfield, searchChange }) => {
  return (
    <div className='SearchBox pa2'>
      <input 
        className='pa3 ba b--green bg-lightest-blue'
        type='search' 
        placeholder='search arts' 
        onChange={searchChange}
      />
    </div>
  );
}

export default SearchBox
