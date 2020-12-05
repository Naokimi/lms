# == Schema Information
#
# Table name: learning_modules
#
#  id           :bigint           not null, primary key
#  description  :text
#  subscription :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class LearningModule < ApplicationRecord
  has_many :purchased_modules
  has_many :users, through: :purchased_modules
  has_many :playlist_modules
  has_many :learning_playlists, through: :playlist_modules
  has_many :exercises, dependent: :destroy
  has_many :video_courses, dependent: :destroy

  validates :title, :description, presence: true
end
