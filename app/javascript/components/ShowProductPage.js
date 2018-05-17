import React from 'react';
import Item from './Item';
import Art from './Art';
import Button from './Button';
import FinalProductDetails from './FinalProductDetails';

class ShowProductPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      product: props.product,
    }
  }  

  handleSubmit = (event) => {
    event.preventDefault();
  }

  render(){
    const { product } = this.state;
    return (
      <div className="ShowProductPage">
        <div className="app-container">
          <div className="col-1">
            <Item 
              img={"https://s3.ca-central-1.amazonaws.com/takeshape/finalproduct1.png"} 
              // img={product.item.images[0]} 
            />
            {/* <Art 
              img={product.art.images[0]} 
            /> */}
          </div>
          <div className="col-2 no-gutters">
            <FinalProductDetails 
              name={product.title} 
              price={product.price} 
              subtitle={product.subtitle} 
              description={product.description} 
              FormChange={this.onFormChange}
            />
          <div> 
            <span><a className="btn" href={`/line_items/${product.id}`}>Add to cart!</a></span>
            <input className="button checkout-btn" value={text} type="submit" onClick={onSubmit} />
          </div>
          </div>
        </div>
      </div>
    )
  }
}

export default ShowProductPage