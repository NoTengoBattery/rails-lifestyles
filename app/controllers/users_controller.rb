class UsersController < ApplicationController
  before_action :empty_user, only: [:sign_up]
  after_action :update_session_user, only: [:create]

  def sign_up; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: I18n.t("user.notice.sign_up")
    else
      flash.now[:alert] = I18n.t("user.alert.sign_up")
      render :sign_up
    end
  end

  def show; end

  private
    def empty_user; @user = User.new; end
    def update_session_user; self.session_user = @user.id; end

    def user_params
      params.require(:user).permit(:Name)
    end
end
