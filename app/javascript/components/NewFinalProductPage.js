import React from 'react';
import FormForFinalProduct from './FormForFinalProduct';
import Item from './Item';
import classes from './NewFinalProductPage.css'

class NewFinalProductPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      arts: props.arts,
      items: props.items,
      product: props.product
    };
  }

  onFormChange = (event) => {
    this.setState({ formfield: event.target.value })
  }

  render(){
    const { items = {}, arts = {}, product = [] } = this.state;
    return (
      <div className="FinalProductPage app-container">
        <div className="row">
          <div className="col">
            <Item 
              name={product.title} 
              price={product.price} 
              img={"http://via.placeholder.com/500x500"} 
            />
          </div>
          <div className="col no-gutters">
            <FormForFinalProduct 
              arts={arts} 
              items={items} 
              product={product} 
              FormChange={this.onFormChange}/>
          </div>
        </div>
       </div>
    )
  }
}

export default NewFinalProductPage