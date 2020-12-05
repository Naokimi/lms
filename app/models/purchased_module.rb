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
class PurchasedModule < ApplicationRecord
  belongs_to :learning_module
  belongs_to :user

  validate :matching_subscriptions

  private

  def matching_subscriptions
    subscription_included = user.subscription >= learning_module.subscription

    errors.add(:unauthorized, "This module isn't part of your subscription") unless subscription_included
  end
end
