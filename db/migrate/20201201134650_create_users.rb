class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :token
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :admin
      t.integer :subscription, default: 0

      t.timestamps
    end
  end
end
