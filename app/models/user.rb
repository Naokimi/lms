# == Schema Information
#
# Table name: users
#
#  id           :bigint           not null, primary key
#  admin        :boolean
#  email        :string
#  first_name   :string
#  last_name    :string
#  subscription :integer          default(0)
#  token        :string
#  uid          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class User < ApplicationRecord
  has_many :purchased_modules
  has_many :learning_modules, through: :purchased_modules
  has_many :saved_playlists
  has_many :learning_playlists, through: :saved_playlists

  validates :subscription, inclusion: [0, 1, 2] # free, regular, premium
end
