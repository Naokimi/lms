# == Schema Information
#
# Table name: purchased_modules
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  learning_module_id :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_purchased_modules_on_learning_module_id  (learning_module_id)
#  index_purchased_modules_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (learning_module_id => learning_modules.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe PurchasedModule, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
