import React from 'react';
import {injectStripe} from 'react-stripe-elements';
import CardSection from './CardSection';

class CheckoutForm extends React.Component {
  handleSubmit = (ev) => {
    ev.preventDefault();
    this.props.stripe.createToken({name: 'Jenny Rosen'}).then(({token}) => {
      return fetch(this.props.orderUrl, {
        method: 'POST',
        headers: new Headers({
          'X-Requested-With': 'XMLHttpRequest',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
        }),
        body: JSON.stringify({
          stripeToken: token.id
        }),
        credentials: 'same-origin'
      });  
    }).then((response) => response.json()).then((json) => {
      window.location = json.redirect_url;
    });
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <CardSection />
        <button>Confirm order</button>
      </form>
    );
  }
}

export default injectStripe(CheckoutForm);