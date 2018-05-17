import React from 'react';

const ArtCard = ({ image, title, id, option }) => {
  return (
    <div className='Card tc bg-light-gray dib br3 pa3 ma2 grow'>     
      <a href={`/arts/${id}`}><img src={image}/></a>
    </div>
  )
}

export default ArtCard