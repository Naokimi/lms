class CreatePurchasedModules < ActiveRecord::Migration[6.0]
  def change
    create_table :purchased_modules do |t|
      t.references :learning_module, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
