class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  # def index
  #   @shelter = Shelter.find(params[:id])
  # end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.create!(pet_params)
  end

  def show
    @shelter = Shelter.find(params[:id])
    @pets = Pet.all
  end

  private

  def pet_params
    params.permit(:image, :name, :age, :sex, :current_shelter)
  end

end
