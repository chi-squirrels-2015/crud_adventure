class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :average_rating

      t.belongs_to :city

      t.timestamps
    end
  end
end
