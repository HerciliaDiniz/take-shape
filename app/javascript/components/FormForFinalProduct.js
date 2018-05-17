import React from 'react'
import ProductForm from './ProductForm'
import Input from './Input'
import Button from './Button'

const FormForFinalProduct = ({ arts, items, product, FormChange, SelectArtChange, SelectItemChange = () => {} }) => (
 <div className="FormForFinalProduct checkout">
    <div className="checkout-container">
     <h3 className="heading-3">Give a shape to someone's design:</h3>
      <div className="row">
        <div className="col">
          <Input 
            label="Name" 
            type="text" 
            name={"final_product[title]"}
            InputChange={FormChange}
          />
        </div>
        <div className="col">
          <Input 
            label="Subtitle" 
            type="text" 
            name={"final_product[subtitle]"} 
          />
        </div>
        <div className="col">
          <Input 
            label="Description" 
            type="text" 
            name={"final_product[description]"} 
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