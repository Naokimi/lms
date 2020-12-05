# == Schema Information
#
# Table name: playlist_modules
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  learning_module_id   :bigint           not null
#  learning_playlist_id :bigint           not null
#
# Indexes
#
#  index_playlist_modules_on_learning_module_id    (learning_module_id)
#  index_playlist_modules_on_learning_playlist_id  (learning_playlist_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_module_id => learning_modules.id)
#  fk_rails_...  (learning_playlist_id => learning_playlists.id)
#
require 'rails_helper'

RSpec.describe PlaylistModule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
