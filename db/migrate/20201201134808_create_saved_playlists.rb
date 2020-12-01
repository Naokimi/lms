class CreateSavedPlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_playlists do |t|
      t.references :users, null: false, foreign_key: true
      t.references :learning_playlists, null: false, foreign_key: true

      t.timestamps
    end
  end
end
