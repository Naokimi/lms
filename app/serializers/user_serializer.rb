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
class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :token, :subscription_level

  def subscription_level
    case object.subscription
    when 0 then 'basic'
    when 1 then 'premium'
    when 2 then 'professional'
    end
  end
end
