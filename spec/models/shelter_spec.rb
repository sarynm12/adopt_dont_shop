require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
  end
end

RSpec.describe 'Shelters index page' do
  describe 'they visit /articles' do
    it 'should know shelter name' do
      shelter_1 = Shelter.create(name: "Dumb Friends League")
      shelter_2 = Shelter.create(name: "Littleton Shelter")

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end
end

# RSpec.describe 'Shelter has a name, address, city, state, and zip' do
#   it 'should return shelter info' do
#     shelter_1 = Shelter.create(name: "Dumb Friends League", address: "1234 S. University Blvd.", city: "Denver", state: "CO", zip: 80209)
#     shelter_2 = Shelter.create(name: "Littleton Shelter", address: "2468 E. Orchard Rd.", city: "Littleton", state: "CO", zip: 80121)
#
#     #require "pry"; binding.pry
#     visit '/shelters/:id'
#
#     expect(page).to have_content(shelter_1.name)
#     expect(page).to have_content(shelter_1.address)
#     expect(page).to have_content(shelter_1.city)
#     expect(page).to have_content(shelter_1.state)
#     expect(page).to have_content(shelter_1.zip)
#     expect(page).to have_content(shelter_2.name)
#     expect(page).to have_content(shelter_2.address)
#     expect(page).to have_content(shelter_2.city)
#     expect(page).to have_content(shelter_2.state)
#     expect(page).to have_content(shelter_2.zip)
#   end
# end
