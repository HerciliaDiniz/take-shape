import React from 'react';

const Input = ({ InputChange, type, name, label }) => (
  <div className="Input">
    <label>{label}</label>
    <div className="input-field">
      <input type={type} name={name} onChange={InputChange} />
    </div>
  </div>
);

export default Input