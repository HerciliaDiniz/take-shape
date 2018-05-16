import React from 'react';
import FormForFinalProduct from './FormForFinalProduct';
import Item from './Item';

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
      <div className="NewFinalProductPage">
        <div className="app-container">
          <div className="row">
            <div className="col">
              <Item 
                name={product.title} 
                price={product.price} 
                img={"http://via.placeholder.com/600x600"} 
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
      </div>
    )
  }
}

export default NewFinalProductPage