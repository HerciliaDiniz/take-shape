import React from 'react';

const Input = (props) => (
  <div className="Input">
    <label>{props.label}</label>
    <div className="input-field">
      <input type={props.type} name={props.name} />
    </div>
  </div>
);

export default Input