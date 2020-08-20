class CreateSheltersInfo < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters_infos do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps 
    end
  end
end
