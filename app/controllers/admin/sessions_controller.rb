module Admin
  class SessionsController < ApplicationController
    def new
    end

    def create
      if user
        if user.authenticate(params['password'])
          login
        else
          cannot_login
        end
      else
        cannot_login
      end
    end

    def destroy
      if session[:user_id]
        session[:user_id] = nil
        logout
      else
        render 'new'
      end
    end

    private

    def user
      @user ||= User.find_by(username: params['username'])
    end

    def login
      session[:user_id] = user.id
      flash[:success] = I18n.t('success.login_success')
      redirect_to admin_root_path
    end

    def logout
      flash[:success] = I18n.t('success.logout_success')
      redirect_to new_admin_session_path
    end

    def cannot_login
      flash[:danger] = I18n.t('error.login_error')
      render 'new'
    end
  end
end
