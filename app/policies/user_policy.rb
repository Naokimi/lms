class UserPolicy < ApplicationPolicy
  def upgrade_to_premium?
    @user.admin?
  end

  alias upgrade_to_professional? upgrade_to_premium?
end
