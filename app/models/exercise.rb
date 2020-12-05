# == Schema Information
#
# Table name: exercises
#
#  id                 :bigint           not null, primary key
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  learning_module_id :bigint           not null
#
# Indexes
#
#  index_exercises_on_learning_module_id  (learning_module_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_module_id => learning_modules.id)
#
class Exercise < ApplicationRecord
  belongs_to :learning_modules
end
