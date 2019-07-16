# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])

    if params[:user][:email].blank? || params[:user][:password].blank?
      # JSで入力チェックエラー表示
    elsif user&.valid_password?(params[:user][:password])
      super
    else
      flash[:need_new_account] = 'メールアドレスまたはパスワードが違います'
      redirect_to new_user_session_path
      # JSで同値チェックエラー表示
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
