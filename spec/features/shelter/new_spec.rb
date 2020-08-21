require 'rails_helper'

RSpec.describe 'Update Shelter' do
  describe 'As a visitor' do
    describe 'When I visit the shelters index' do
      it 'can create a new shelter' do

        visit "/shelters"

        click_on 'Create New Shelter'

        expect(current_path).to eq("/shelters/new")

        fill_in 'Name', with: 'Littleton Shelter'
        fill_in 'Address', with: '123 Dog Drive'
        fill_in 'City', with: 'Littleton'
        fill_in 'State', with: 'CO'
        fill_in 'Zip', with: '80111'
        click_on 'Create Shelter'

        expect(current_path).to eq("/shelters")
        expect(page).to have_content('Littleton Shelter')
      end
    end
  end
end
