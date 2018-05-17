import React from 'react';

const Content = ({ title, p1, p2 }) => (
  <article className="pa1 pa5-ns">
    <h1 className="f3 f1-m f-headline-l">{title}</h1>
    <p className="measure lh-copy content-text">{p1}</p>
    <p className="measure lh-copy content-text">{p2}</p>
  </article>
);

export default Content