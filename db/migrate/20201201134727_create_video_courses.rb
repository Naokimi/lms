class CreateVideoCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :video_courses do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.references :learning_module, null: false, foreign_key: true

      t.timestamps
    end
  end
end
