class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter_id = params[:shelter_id]
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    @new_pet = @shelter.pet.new(pet_params)
    @new_pet.save
    redirect_to("/shelters/#{@shelter.id}/pets")
  end

  def shelters_index
   @shelter = Shelter.find(params[:id])
   @pets = @shelter.pet
 end

 def edit
   @pet = Pet.find(params[:id])
 end

 def update
   pet = Pet.find(params[:id])
   pet.update(pet_params)
   pet.save
   redirect_to "/pets/#{pet.id}"
 end

 def destroy
   Pet.destroy(params[:id])
   redirect_to "/pets"
 end

  private

  def pet_params
    params.permit(:image, :name, :description, :age, :sex, :current_shelter, :adoption_status)
  end

end
