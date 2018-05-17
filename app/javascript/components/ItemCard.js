import React from 'react';

const ItemCard = ({ image, title, id, option }) => {
  return (
    <div className='Card tc bg-light-gray dib br3 pa3 ma2 grow'>     
      <a href={`/items/${id}`}><img src={image}/></a>
    </div>
  )
}

export default ItemCard
