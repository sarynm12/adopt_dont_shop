require 'rails_helper'

RSpec.describe "seeing a shelter's pets" do
  it "can view pets" do
    shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)
    pet_1 = shelter_1.pet.create!(image: 'image_link', name: 'Hudson', age: 2, sex: 'Male', current_shelter: "Dumb Friends League")
    pet_2 = shelter_1.pet.create!(image: 'image_link', name: 'Lucy', age: 6, sex: 'Female', current_shelter: "None")

    visit "/shelters/#{shelter_1.id}/pets"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
  end
end
