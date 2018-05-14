import React from 'react';

const Card = ({ image, title, subtitle, price }) => {
  return (
    <div className='Card tc bg-light-gray dib br3 pa3 ma2 grow'> 
      <img src='{image}' />
      <div>
        <h2>{title}</h2>
        <p>{subtitle}</p>
        <p>$ {price}</p>
      </div>
    </div>
  )
}

export default Card
