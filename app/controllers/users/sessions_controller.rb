# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = current_user
    #binding.pry 
    user.daily_attendances.create(
      attendance_date: Date.current,
      in_time: DateTime.current
    )
    super
  end

  # DELETE /resource/sign_out
  def destroy
    user = current_user
    user.daily_attendances.last.update(
      out_time: DateTime.current
    )
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
