class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return if user_signed_in?
    store_location
    flash[:danger] = t "sessions.login.please_login"
    redirect_to login_url
  end

  rescue_from CanCan::AccessDenied do
    flash[:warning] = t "cancancan.exception"
    redirect_to root_path
  end

  def verify_suppervisor
    redirect_to :root unless current_user.suppervisor?
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "users.load_user.error"
    redirect_to users_path
  end

  def correct_user
    redirect_to(root_url) unless current_user? @user
  end

  def course_finish
    if @course.finish?
      flash[:danger] = t "controllers.course_subjects.finish"
      redirect_to @course
    end
  end
end
