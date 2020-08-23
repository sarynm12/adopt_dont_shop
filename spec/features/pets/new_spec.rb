require 'rails_helper'

RSpec.describe 'Create New Pet' do
  describe 'As a visitor' do
    describe 'When I visit a shelter page' do
      it 'can create a new pet' do
        shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)

        visit "/shelters/#{shelter_1.id}/pets"

        click_on 'Create New Pet'

        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

        fill_in 'Name', with: 'Lucy'
        if has_field?('Description')
          fill_in 'Description', with: 'The cutest dog to ever live'
        end
        if has_field?('Age')
          fill_in 'Age', with: 6
        end
        if has_field?('Sex')
          fill_in 'Sex', with: 'Female'
        end

        click_on 'Create Pet'

        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
        expect(page).to have_content('Lucy')
        expect(page).to have_content('The cutest dog to ever live')
        expect(page).to have_content('6')
        expect(page).to have_content('Female')
        expect(page).to have_content('Adoptable')
      end
    end
  end
end
