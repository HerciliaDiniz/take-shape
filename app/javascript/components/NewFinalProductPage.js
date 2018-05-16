import React from 'react';
import FormForFinalProduct from './FormForFinalProduct';
import Item from './Item';

class NewFinalProductPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      arts: props.arts,
      items: props.items,
      product: props.product,
      selectedArt: '',
      selectedItem: ''
    };
  }

  onFormChange = (event) => {
    this.setState({ formfield: event.target.value })
  }

  onSelectArtChange = (event) => {
    this.setState({ artId: event.target.value })
    let selectedArt = this.state.arts.filter( (art) => {
        return (art.id === parseInt(event.target.value))
    })
    this.setState({ artImage: selectedArt[0].images[0] })
  } 

  onSelectItemChange = (event) => {
    this.setState({ itemId: event.target.value })
    let selectedItem = this.state.items.filter((item) => {
      return (item.id === parseInt(event.target.value))
    })
    this.setState({ itemImage: selectedItem[0].images[0] })
  } 

  render(){
    const { items = [], arts = [], product = [] } = this.state;
    return (
      <div className="NewFinalProductPage">
        <div className="app-container">
          <div className="row">
            <div className="col">
              <Item 
                name={product.title} 
                price={product.price} 
                img={this.state.itemImage} 
              />
             </div> 
            <div className="col">  
              <Item 
                name={product.title} 
                price={product.price} 
                img={this.state.artImage} 
              />
            </div>
            <div className="col no-gutters">
              <FormForFinalProduct 
                arts={arts} 
                items={items} 
                product={product} 
                FormChange={this.onFormChange}
                SelectArtChange={this.onSelectArtChange}
                SelectItemChange={this.onSelectItemChange}
              />
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default NewFinalProductPage