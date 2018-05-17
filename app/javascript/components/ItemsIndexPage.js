import React from "react"
import ItemCardList from './ItemCardList';
import SearchBox from './SearchBox';
import Scroll from './Scroll';

class ItemsIndexPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      items: props.items,
      searchfield: ''
    };
  }
  
  onSearchChange = (event) => {
    this.setState({ searchfield: event.target.value })
  }

  render () {
    const { items, searchfield } = this.state;

    const filteredItems = items.filter(item => {
      return item.title.toLowerCase().includes(searchfield.toLowerCase())
    })
    return !items.length ? 
      <h1>Loading</h1> :
      (
        <div className='ItemsIndexPage tc'>
          <h1 className="heading-3">Items</h1>
          <SearchBox searchChange={this.onSearchChange} />
          <Scroll>
          <ItemCardList options={filteredItems} />
          </Scroll>
        </div>
      );
  }
}

export default ItemsIndexPage
