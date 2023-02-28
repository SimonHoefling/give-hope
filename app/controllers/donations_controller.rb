class DonationsController < ApplicationController
    before_action :set_restaurant, only: %i[new create]
    def new
      @charity = Charity.new
    end


    def create
      @donation = Donation.new(donation_params)
      @donation.charity = @charity
    end



    private

    def donation_params
      params.require(:restaurant).permit(:amount, :started, :ended, :user, :status, :charity)
    end

    def set_Charity
      @charity = charity.find(params[:charity_id])
   end

end
