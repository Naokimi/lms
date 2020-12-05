# == Schema Information
#
# Table name: saved_playlists
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  learning_playlist_id :bigint           not null
#  user_id              :bigint           not null
#
# Indexes
#
#  index_saved_playlists_on_learning_playlist_id  (learning_playlist_id)
#  index_saved_playlists_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_playlist_id => learning_playlists.id)
#  fk_rails_...  (user_id => users.id)
#
class SavedPlaylist < ApplicationRecord
  belongs_to :user
  belongs_to :learning_playlist
end
