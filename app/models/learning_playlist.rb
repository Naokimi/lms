# == Schema Information
#
# Table name: learning_playlists
#
#  id          :bigint           not null, primary key
#  description :text
#  tag         :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class LearningPlaylist < ApplicationRecord
  has_many :saved_playlists
  has_many :users, through: :saved_playlists
  has_many :playlist_modules
  has_many :learning_modules, through: :playlist_modules
end
