import React from 'react';
import {Elements} from 'react-stripe-elements';
import InjectedCheckoutForm from './CheckoutForm';

class StoreCheckout extends React.Component {
  render() {
    return (
      <Elements>
        < InjectedCheckoutForm orderUrl = {
          this.props.orderUrl
        }
        />
      </Elements>
    );
  }
}

export default StoreCheckout;