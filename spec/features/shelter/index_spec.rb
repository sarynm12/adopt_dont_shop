require 'rails_helper'

RSpec.describe 'Shelters index page' do
  describe 'they visit /shelters' do
    it 'should know shelter names' do
      shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)
      shelter_2 = Shelter.create!(name: "Littleton Shelter", address: "2468 E. Orchard Rd.", city: "Littleton", state: "CO", zip: 80121)

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end

  describe 'they visit /shelters/id' do
    it 'should know shelter attributes' do
      shelter_1 = Shelter.create!(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)

      visit "/shelters/#{shelter_1.id}"

      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)

      shelter_2 = Shelter.create!(name: "Littleton Shelter", address: "2468 E. Orchard Rd.", city: "Littleton", state: "CO", zip: 80121)
      
      visit "/shelters/#{shelter_2.id}"

      expect(page).to have_content(shelter_2.address)
      expect(page).to have_content(shelter_2.city)
      expect(page).to have_content(shelter_2.state)
      expect(page).to have_content(shelter_2.zip)
    end
  end
end
