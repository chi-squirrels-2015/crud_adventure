class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating

      t.belongs_to :user
      t.belongs_to :restaurant

      t.timestamps
    end
  end
end
