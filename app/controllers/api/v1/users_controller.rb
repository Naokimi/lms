class Api::V1::UsersController < ActionController::API
  before_action :set_user, only: %i[login admin upgrade_to_premium upgrade_to_professional]

  def create
    user = User.new(user_params)

    begin
      user.save!
      token = TokenRequester.new.call
      user.update(token: token)
      render json: user, status: :created
    rescue StandardError => e
      render json: e, status: 500
    end
  end

  def login
    token = TokenRequester.new.call
    @user.update(token: token)
    render json: @user
  end

  def promote_to_admin
    @user.update(admin: true)
    render json: { message: "User #{@user.id} promoted to admin" }
  end

  def upgrade_to_premium
    @user.update(subscription: 1)
    render json: { message: "User #{@user.id} upgraded to premium" }
  end

  def upgrade_to_professional
    @user.update(subscription: 2)
    render json: { message: "User #{@user.id} upgraded to professional" }
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
