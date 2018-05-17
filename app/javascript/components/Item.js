import React from 'react'

const Item = ({img, name, price}) => (
  <div className="item-container">
    <div className="item-details">
      <div className="item-name">{name}</div>
      <div className="item-price">$ {price}</div>
    </div>
    <div className="item-image">
      <img src={img}/>
    </div>
  </div>
);

export default Item