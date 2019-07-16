# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    user = User.find_by(email: params[:user][:email])
    email_format_check = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    if params[:user][:nickname].blank? ||
       params[:user][:email].blank? ||
       params[:user][:password].blank? ||
       params[:user][:password_confirmation].blank?
      # JSで入力エラー表示
    elsif params[:user][:email] !~ email_format_check
      # JSでメールアドレスの不適切フォーマットエラーの表示
    elsif params[:user][:password] != params[:user][:password_confirmation]
      # JSでパスワード不一致エラー表示
    elsif user
      # 重複エラーはリロードで表示
      flash[:same_email] = 'すでに登録済みのメールアドレスです。'
      redirect_to new_user_registration_path
    else
      super
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
