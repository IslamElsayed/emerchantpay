# frozen_string_literal: true

module Admins
  class MerchantsController < ::ApplicationController
    before_action :set_merchant, only: %i[edit destroy update]

    def index
      @merchants = Merchant.all
    end

    def edit; end

    def update
      respond_to do |format|
        if @merchant.update(merchant_params)
          format.html { redirect_to merchants_path, notice: 'merchant was successfully updated.' }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @merchant.destroy

      respond_to do |format|
        format.html { redirect_to merchants_url, notice: 'merchant was successfully destroyed.' }
      end
    end

    private

    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    def merchant_params
      params.require(:merchant).permit(:email, :name, :description)
    end
  end
end
