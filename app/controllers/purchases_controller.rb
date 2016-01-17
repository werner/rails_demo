# Public: Endpoint for a user to perform a purchase.
class PurchasesController < ApplicationController
  def create
    purchase = Purchase.new(purchase_params)
    purchase.user = current_user

    respond_to do |format|
      if purchase.save
        format.json { render json: { purchase: purchase, status: :created } }
      else
        format.json { render json: purchase.errors }
      end
    end
  end

  def purchase_params
    params.require(:purchase).permit(:purchase_option_id,
                                     :purchasable_id,
                                     :purchasable_type)
  end
end
