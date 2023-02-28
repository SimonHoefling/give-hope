class DonationsController < ApplicationController

    before_action :set_charity, only: %i[new create]
    def new
      @donation = Donation.new
      @donation.charity = @charity
      @donation.user = current_user
    end


  def create
    @donation = Donation.new(donation_params)
    @donation.charity = @charity
  end


    def create
      @donation = Donation.new(donation_params)
      @donation.charity = @charity
      @donation.user = current_user
      @donation.save
      redirect_to charity_path(@charity)
    end


  def donation_params
    params.require(:restaurant).permit(:amount, :started, :ended, :user, :status, :charity)
  end



    private

    def donation_params
      params.require(:donation).permit(:amount, :started, :ended, :status)
    end

    def set_charity
      @charity = Charity.find(params[:charity_id])
   end


end
