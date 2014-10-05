class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :manufacturer, null: false
      t.string :model_name, null: false
      t.integer :year, null: false
      t.integer :mileage, null: false
      t.string :color, null: false
      t.string :description

      t.timestamps
    end
  end
end
