class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def new
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def create
    new_shelter = Shelter.new({
          name: params[:name],
          address: params[:address],
          city: params[:city],
          state: params[:state],
          zip: params[:zip]
      })

    new_shelter.save

    redirect_to '/shelters'
  end

end