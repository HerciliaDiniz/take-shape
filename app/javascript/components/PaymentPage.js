import React from "react";
import ProgressBar from "./ProgressBar";

class PaymentPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      loading: true,
      items: []
    }
  }

  render () {
    return (
      <ProgressBar />
    );
  }
}

export default PaymentPage;