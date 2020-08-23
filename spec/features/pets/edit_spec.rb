require 'rails_helper'

RSpec.describe 'Edit Pet' do
  describe 'As a visitor' do
    describe 'When I visit the pets page' do
      it 'can edit a pet' do
        shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)
        pet_1 = shelter_1.pet.create!(image: 'corgi.jpg', name: 'Hudson', description: 'Corgi', age: 2, sex: 'Male', current_shelter: 'Dumb Friends League', adoption_status: 'Adoptable')

        visit "/pets/#{pet_1.id}"

        click_on 'Edit Pet'

        expect(current_path).to eq("/pets/#{pet_1.id}/edit")

        fill_in 'Name', with: 'Larry'
        click_on 'Update Pet'

        expect(current_path).to eq("/pets/#{pet_1.id}")
        expect(page).to have_content('Larry')
      end
    end
  end
end
