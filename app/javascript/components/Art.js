import React from 'react'

const Art = (props) => (
  <div className="art-container">
    <div className="art-image">
      <img src={props.img}/>
    </div>
  </div>
);

export default Art