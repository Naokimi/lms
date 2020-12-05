class Api::V1::LearningModulesController < Api::V1::SecureController
  before_action :set_learning_module, only: %i[show update destroy purchase]

  def index
    learning_modules = policy_scope(LearningModule)
    render json: learning_modules
  end

  def show
    render json: @learning_module
  end

  def create
    learning_module = LearningModule.new(learning_module_params)
    authorize learning_module
    if learning_module.save!
      render json: learning_module, status: :created
    else
      render_error(errors.messages)
    end
  end

  def purchase
    purchased_module = PurchasedModule.new
    purchased_module.learning_module = @learning_module
    purchased_module.user = current_user
    if purchased_module.save!
      render json: { message: "Module #{@learning_module.id} successfully purchased" }, status: :created
    else
      render_error(errors.messages)
    end
  end

  def update
    if @learning_module.update!(learning_module_params)
      render json: @learning_module
    else
      render_error(e.messages)
    end
  end

  def destroy
    @learning_module.destroy
    render json: {}
  end

  private

  def learning_module_params
    params.permit(:title, :description, :subscription)
  end

  def set_learning_module
    @learning_module = LearningModule.find(params[:id])
    authorize @learning_module
  end
end
