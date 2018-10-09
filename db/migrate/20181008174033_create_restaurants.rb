class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.column :name, :string
      t.column :address, :string
      t.column :capacity, :integer, default: 0
      t.timestamps
    end
  end
end
