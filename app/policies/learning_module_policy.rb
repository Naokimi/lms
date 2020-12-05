class LearningModulePolicy < ApplicationPolicy
  def create?
    @user.admin?
  end

  def show?
    true
  end

  alias destroy? create?
  alias update? create?
  alias purchase? show?

  class Scope < Scope
    def resolve
      @scope.all
    end
  end
end
