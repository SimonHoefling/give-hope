class CharitiesController < ApplicationController

  def index
    @charities = Charity.all
  end

  def new
    @charity = Charity.new
  end


  def create
    @charity = Charity.new(charity_params)
    @charity.save
  end

  def show
    @charity = Charity.find(params[:id])
  end

  def edit
    @charity = Charity.find(params[:id])
  end

  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy
  end

  def update
    @charity = Charity.find(params[:id])
    @charity.update(charity_params)
    redirect_to charity_path(@charity)
  end
  private
def charity_params
  params.require(:restaurant).permit(:total_donations, :address, :accepting, :user, :cause)
end
end
