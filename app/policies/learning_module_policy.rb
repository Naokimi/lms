class LearningModulePolicy < ApplicationPolicy
  def create?
    @user.admin?
  end

  def show?
    true
  end

  alias destroy? create?
  alias update? create?

  class Scope < Scope
    def resolve
      @scope.all
    end

    def dashboard_scope
      case @user.role
      when 'admin'   then @scope.all
      # when 'teacher' then @scope.where(worksheet_template_id: @user.worksheet_templates.ids) #TODO: Check the teacher dashboard on frontend and set correct scope
      when 'student' then @user.worksheets
      else @scope.where(id: -1)
      end
    end
  end
end
