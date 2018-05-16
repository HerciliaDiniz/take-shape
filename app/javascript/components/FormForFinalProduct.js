import React from 'react'
import ProductForm from './ProductForm'
import Input from './Input'
import Button from './Button'

const handleSubmit = event => {
  event.preventDefault();

  const formData =  new FormData(event.currentTarget);
  onSubmit({
    title: formData.get("title"),
    subtitle: formData.get("subtitle")
  });
}

const FormForFinalProduct = ({ arts, items, product, onSubmit, SelectArtChange, SelectItemChange = () => {} }) => (
 <div className="FormForFinalProduct checkout" onSubmit={handleSubmit}>
    <div className="checkout-container">
     <h3 className="heading-3">Give a shape to someone's design:</h3>
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
        <div className="Input">
          <label>Choose an item</label>
          <div className="input-field">
            <select onChange={SelectItemChange} name={"final_product[item][id]"}>
              {
                items.map((item, i) => {
                  return (
                    <option key={item.id} value={item.id}>{item.title} | $ {item.price}</option>
                  )  
                })
              }
            </select>
          </div>
        </div>
        <div className="Input">
          <label>Choose a design</label>
          <div className="input-field">
            <select onChange={SelectArtChange} name={"final_product[art][id]"}>
              {
                arts.map((art, i) => {
                  return (
                    <option key={art.id} value={art.id}>{art.title} | $ {art.price}</option>
                  )  
                })
              }
            </select>
          </div>
        </div>
      </div>
      <Button text="Shape!" />
    </div>
 </div>
);

export default FormForFinalProduct