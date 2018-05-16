import React from 'react';

const Button = (props) => (
  <input className="button checkout-btn" value={props.text} type="submit"/>
);

export default Button