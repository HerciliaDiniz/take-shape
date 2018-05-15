import React from 'react'
import Form from './Form'
// import Input from './Input'
// import Button from './Button'

const handleSubmit = event => {
  event.preventDefault();

  const formData =  new FormData(event.currentTarget);
  onSubmit({
    title: formData.get("title"),
    subtitle: formData.get("subtitle")
  });
}

const FormForFinalProduct = ({ arts, items, product, onSubmit = () => {} }) => (
 <div className="FormForFinalProduct" onSubmit={handleSubmit}>
    <div className="checkout-container">
     <h3 className="heading-3">Give shape to someone's design:</h3>
      <div className="row">
        <div className="col">
          <Input 
            label="Name" 
            type="text" 
            name="title"
          />
        </div>
        <div className="col">
          <Input 
            label="Subtitle" 
            type="text" 
            name="subtitle" 
          />
        </div>
        <div className="col">
          <Input 
            label="Description" 
            type="text" 
            name="description" 
          />
        </div>
        <div className="col">
          <Input 
            label="Choose a design" 
            type="select" 
            name="art_id" 
          />
        </div>
      </div>
      <input type="submit" value="Shape!" />
    </div>
 </div>
);

export default FormForFinalProduct