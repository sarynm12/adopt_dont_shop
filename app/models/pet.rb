class Pet < ApplicationRecord
  after_initialize :set_defaults

  belongs_to :shelter
  validates_presence_of :image, :name, :age, :sex, :current_shelter

  def set_defaults
    self.adoption_status ||= 'Adoptable'
  end

end
