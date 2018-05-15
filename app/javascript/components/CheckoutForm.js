import React from 'react';
import {injectStripe} from 'react-stripe-elements';
import CardSection from './CardSection';

class CheckoutForm extends React.Component {
  handleSubmit = (ev) => {
    // We don't want to let default form submission happen here, which would refresh the page.
    ev.preventDefault();

    // Within the context of `Elements`, this call to createToken knows which Element to
    // tokenize, since there's only one in this group.
    this.props.stripe.createToken({name: 'Jenny Rosen'}).then(({token}) => {
      console.log('>>>>>>>>>>>>>>>');
      console.log(token);
      console.log('>>>>>>>>>>>>>>>');
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
      // console.log('Received Stripe token:', token);      
    }).then((response) => response.json()).then((json) => {
      window.location = json.redirect_url;
    });

    // However, this line of code will do the same thing:
    // this.props.stripe.createToken({type: 'card', name: 'Jenny Rosen'});
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