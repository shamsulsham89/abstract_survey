class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :outlet_type_id
      t.integer :time_spent_at_the_philips
      t.string :visibility_of_philips
      t.string :stock_availability_of_philips
      t.string :promoter_of_philips
      t.string :rate_the_presentability_of_the_philips
      t.string :rate_the_communication_skill_of_the_philips
      t.integer :time_spent_at_the_braun
      t.string :visibility_of_the_braun
      t.string :stock_availability_of_the_braun
      t.string :promoter_of_braun
      t.string :rate_the_presentability_of_braun
      t.string :rate_the_communication_skill_of_the_braun
      t.integer :user_id

      t.timestamps
    end
  end
end
