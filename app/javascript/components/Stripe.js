import React from 'react';
import { StripeProvider } from 'react-stripe-elements';
import StoreCheckout from './StoreCheckout';

class Stripe extends React.Component {
  constructor() {
    super();
    this.state = {stripe: null};
  }
  componentDidMount() {
    // Create Stripe instance in componentDidMount
    // (componentDidMount only fires in browser/DOM environment)
    this.setState({stripe: window.Stripe('pk_test_VOt2gEgln81nAMwRTNNyLXvv')});
  }
  render() {
    return (
      <StripeProvider stripe={this.state.stripe}>
        < StoreCheckout orderUrl={this.props.orderUrl } / >
      </StripeProvider>
    );
  }
}

export default Stripe;