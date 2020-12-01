class CreatePlaylistModules < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_modules do |t|
      t.references :learning_modules, null: false, foreign_key: true
      t.references :learning_playlists, null: false, foreign_key: true

      t.timestamps
    end
  end
end
