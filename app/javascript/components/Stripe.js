import React from 'react';
import { StripeProvider } from 'react-stripe-elements';
import StoreCheckout from './StoreCheckout';

const Stripe = () => {
  return (
    <StripeProvider apiKey="pk_test_VOt2gEgln81nAMwRTNNyLXvv">
      <StoreCheckout />
    </StripeProvider>
  );
};

export default Stripe;