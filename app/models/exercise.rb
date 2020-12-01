# == Schema Information
#
# Table name: exercises
#
#  id                  :bigint           not null, primary key
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  learning_modules_id :bigint           not null
#
# Indexes
#
#  index_exercises_on_learning_modules_id  (learning_modules_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_modules_id => learning_modules.id)
#
class Exercise < ApplicationRecord
  belongs_to :learning_modules
end
