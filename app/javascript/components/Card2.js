import React from 'react';

const Card2 = ({ image, title }) => {
  return (
    <div className='Card tc bg-light-gray dib br3 pa3 ma2 grow'>     
      <a href={'/final_products/new'}><img src={image}/></a>
    </div>
  )
}

export default Card2