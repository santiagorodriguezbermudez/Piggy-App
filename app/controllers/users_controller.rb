class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :authorize, only: %i[create new]

  def index
    @users = User.order(:name)
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image_url = user.image.url

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: "#{@user.name} was created succesfully." }
      else
        format.html { render :new }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(current_user.id)
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :image, :password, :password_confirmation)
  end
end
