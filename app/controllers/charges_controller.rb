class ChargesController < ApplicationController

  def new
  end

  def create

    @amount = 5000

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Paiement de  N',
        currency: 'eur',
        })

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
  end

end
