class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.text :description
      t.references :learning_modules, null: false, foreign_key: true

      t.timestamps
    end
  end
end
