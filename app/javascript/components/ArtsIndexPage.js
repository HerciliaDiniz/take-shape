import React from "react"
import ArtCardList from './ArtCardList';
import SearchBox from './SearchBox';
import Scroll from './Scroll';

class ArtsIndexPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      arts: props.arts,
      searchfield: ''
    };
  }
  
  onSearchChange = (event) => {
    this.setState({ searchfield: event.target.value })
  }

  render () {
    const { arts, searchfield } = this.state;

    const filteredArts = arts.filter(art => {
      return art.title.toLowerCase().includes(searchfield.toLowerCase())
    })
    return !arts.length ? 
      <h1>Loading</h1> :
      (
        <div className='ArtsIndexPage tc'>
          <h1 className="heading-3">Designs</h1>
          <SearchBox searchChange={this.onSearchChange} />
          <Scroll>
          <ArtCardList options={filteredArts} />
          </Scroll>
        </div>
      );
  }
}

export default ArtsIndexPage
