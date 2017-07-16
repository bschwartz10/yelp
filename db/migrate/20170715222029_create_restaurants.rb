class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
