class CreateStockAvailabilityTypes < ActiveRecord::Migration
  def change
    create_table :stock_availability_types do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
