class CreateVisibilityTypes < ActiveRecord::Migration
  def change
    create_table :visibility_types do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
