class CreateLearningModules < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_modules do |t|
      t.string :title
      t.text :description
      t.integer :subscription, default: 0

      t.timestamps
    end
  end
end
