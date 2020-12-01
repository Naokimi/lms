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
require 'rails_helper'

RSpec.describe LearningPlaylist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
