class CreateRateThePresentabilityTypes < ActiveRecord::Migration
  def change
    create_table :rate_the_presentability_types do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
