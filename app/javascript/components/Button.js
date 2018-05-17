import React from 'react';

const Button = ({ text, onSubmit }) => (
  <input className="button checkout-btn" value={text} type="submit" onClick={onSubmit} />
);

export default Button