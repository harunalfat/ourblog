class AdminController < ApplicationController
  helper_method :current_user
  layout 'backoffice'

  def authenticate
    unless current_user
      flash[:warning] = I18n.t('error.not_logged')
      redirect_to new_admin_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
