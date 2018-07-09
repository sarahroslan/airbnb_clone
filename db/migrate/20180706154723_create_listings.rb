class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|

    	t.text :description
      t.string :address
      t.string :home_type
      t.integer :accommodates
      t.integer :bedroom
      t.integer :bathroom
      t.boolean :is_kitchen
      t.boolean :is_internet
      t.integer :price
      
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
