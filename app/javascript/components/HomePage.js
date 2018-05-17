import React, { Component } from "react";
import Gallery from './Gallery';
import Content from './Content';
import content from "./contentText";

class HomePage extends Component {
  constructor(props) {
    super(props);

    this.state = {
      displayedContent: content["welcome"]
    };
  }

  onSelectionChange = (event) => {
    let bannerChoice = event.target.id
    if (bannerChoice === "1") {
      this.setState({ displayedContent: content["welcome"] })
    } else if (bannerChoice === "2") {
      this.setState({ displayedContent: content["how"] })
    } else if (bannerChoice === "3") {
      this.setState({ displayedContent: content["who"] })
    }
  }

  render () {
    return (
      <main className="HomePage">
        <Gallery SelectChange={this.onSelectionChange} />
        <Content 
          title={this.state.displayedContent["title"]} 
          p1={this.state.displayedContent["body"]["p1"]} 
          p2={this.state.displayedContent["body"]["p2"]} 
        />
      </main>
    )
  }
}
export default HomePage;