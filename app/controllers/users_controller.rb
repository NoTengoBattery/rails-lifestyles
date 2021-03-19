class UsersController < ApplicationController
  before_action :empty_user
  before_action :session_user_destroy, only: [:sign_in, :sign_out, :sign_up]
  before_action :user_from_params, only: [:edit, :show]
  after_action :session_update_user, only: [:new_user, :new_session]

  def new_user
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: I18n.t("user.notice.sign_up")
    else
      flash.now[:alert] = I18n.t("user.alert.sign_up")
      render :sign_up
    end
  end

  def sign_out
    redirect_back fallback_location: root_path, notice: I18n.t("user.notice.sign_out")
  end

  def new_session
    @user = User.find_by(user_params) || @user
    if @user.valid?
      redirect_to @user, notice: I18n.t("user.notice.sign_in")
    else
      flash.now[:alert] = I18n.t("user.alert.sign_in")
      render :sign_in
    end
  end

  def update
    @user = find_user_param_id || @user
    @user.update(user_params)
    if @user.valid?
      redirect_to @user, notice: I18n.t("user.notice.edit")
    else
      redirect_to edit_user_url, notice: I18n.t("user.alert.edit")
    end
  end

  def show
    @votes = @user.votes
    @articles = @user.articles.order(votes_count: :desc).limit(10)
  end

  private
    def empty_user
      @user = User.new
    end

    def session_update_user
      self.session_user = @user.id
    end

    def user_from_params
      @user = User.find(params.require(:id))
    end

    def user_params
      params.require(:user).permit(:Name)
    end
end
