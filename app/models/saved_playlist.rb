# == Schema Information
#
# Table name: saved_playlists
#
#  id                    :bigint           not null, primary key
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  learning_playlists_id :bigint           not null
#  users_id              :bigint           not null
#
# Indexes
#
#  index_saved_playlists_on_learning_playlists_id  (learning_playlists_id)
#  index_saved_playlists_on_users_id               (users_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_playlists_id => learning_playlists.id)
#  fk_rails_...  (users_id => users.id)
#
class SavedPlaylist < ApplicationRecord
  belongs_to :users
  belongs_to :learning_playlists
end
