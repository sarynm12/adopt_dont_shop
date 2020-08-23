require 'rails_helper'

RSpec.describe "seeing a shelter's pets" do
  it "can view pets" do
    shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)
    pet_1 = shelter_1.pet.create!(image: 'corgi.jpg', name: 'Hudson', age: 2, sex: 'Male', current_shelter: 'Dumb Friends League')
    pet_2 = shelter_1.pet.create!(image: 'image1.jpg', name: 'Lucy', age: 6, sex: 'Female', current_shelter: 'Dumb Friends League')

    visit "/shelters/#{shelter_1.id}/pets"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
  end

  describe 'a single pets show page' do
    it 'can render all pet attributes including description and adoption status' do
      shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)
      pet_1 = shelter_1.pet.create!(image: 'corgi.jpg', name: 'Hudson', age: 2, sex: 'Male', current_shelter: 'Dumb Friends League')
      pet_2 = shelter_1.pet.create!(image: 'image1.jpg', name: 'Lucy', age: 6, sex: 'Female', current_shelter: 'Dumb Friends League')

      visit "/pets/#{pet_1.id}"

      expect(current_path).to eq("/pets/#{pet_1.id}")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.adoption_status)
    end
  end
end
