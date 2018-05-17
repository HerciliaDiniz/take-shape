import React from 'react';

const FinalProductDetails = ({ name, price, subtitle, description }) => (
  <div>
    <p>{name}</p>    
    <p>{price.toLocaleString('en-US', {style: 'currency', currency: 'USD'})}</p>    
    <p>{subtitle}</p>    
    <p>{description}</p>    
  </div>
)

export default FinalProductDetails