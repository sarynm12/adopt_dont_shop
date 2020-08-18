require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
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
