class CreateRateTheCommunicationSkillTypes < ActiveRecord::Migration
  def change
    create_table :rate_the_communication_skill_types do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
