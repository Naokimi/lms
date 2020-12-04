class Api::V1::UsersController < ActionController::API
  before_action :set_user, only: %i[login admin]

  def create
    @user = User.new(user_params)

    begin
      @user.save!
      token = TokenRequester.new.call
      @user.update(token: token)
      render :show, status: :created
    rescue StandardError => e
      render json: e, status: 500
    end
  end

  def login
    token = TokenRequester.new.call
    @user.update(token: token)
    render :show
  end

  def admin
    @user.update(admin: true)
    render json: { message: "User #{@user.id} upgraded to admin" }
  end

  # regular subscription

  # premium subscription

  private

  def user_params
    params.permit(:email, :first_name, :last_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
