# == Schema Information
#
# Table name: video_courses
#
#  id                  :bigint           not null, primary key
#  description         :text
#  title               :string
#  video_url           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  learning_modules_id :bigint           not null
#
# Indexes
#
#  index_video_courses_on_learning_modules_id  (learning_modules_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_modules_id => learning_modules.id)
#
class VideoCourse < ApplicationRecord
  belongs_to :learning_modules
end
