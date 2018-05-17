import React from 'react';

const Gallery = ({ SelectChange }) => (
    <div className="gallery">
      <div className="gallery-wrap">
        <div onClick={SelectChange} id="1" className="gallery-item gallery-item-1"></div>
        <div className="gallery-item gallery-item-2"></div>
        <div onClick={SelectChange} id="2" className="gallery-item gallery-item-3"></div>
        <div className="gallery-item gallery-item-4"></div>
        <div onClick={SelectChange} id="3"className="gallery-item gallery-item-5"></div>
      </div>
    </div>
);

export default Gallery