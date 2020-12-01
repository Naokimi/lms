class CreateLearningPlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :learning_playlists do |t|
      t.string :title
      t.text :description
      t.string :tag

      t.timestamps
    end
  end
end
