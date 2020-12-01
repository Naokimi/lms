# == Schema Information
#
# Table name: playlist_modules
#
#  id                    :bigint           not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  learning_modules_id   :bigint           not null
#  learning_playlists_id :bigint           not null
#
# Indexes
#
#  index_playlist_modules_on_learning_modules_id    (learning_modules_id)
#  index_playlist_modules_on_learning_playlists_id  (learning_playlists_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_modules_id => learning_modules.id)
#  fk_rails_...  (learning_playlists_id => learning_playlists.id)
#
class PlaylistModule < ApplicationRecord
  belongs_to :learning_modules
  belongs_to :learning_playlists
end
