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
require 'rails_helper'

RSpec.describe Exercise, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
