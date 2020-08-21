require 'rails_helper'

RSpec.describe 'Update Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the shelters index' do
      it 'can update a shelter' do
        shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)

        visit "/shelters/#{shelter_1.id}"

        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

        fill_in 'Name', with: 'Denver Dumb Friends League'
        click_on 'Update Shelter'

        expect(current_path).to eq("/shelters/#{shelter_1.id}")
        expect(page).to have_content('Denver Dumb Friends League')
      end
    end
  end
end
