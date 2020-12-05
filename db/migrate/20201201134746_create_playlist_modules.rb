class CreatePlaylistModules < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_modules do |t|
      t.references :learning_module, null: false, foreign_key: true
      t.references :learning_playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
