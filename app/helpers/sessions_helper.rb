module SessionsHelper

  def current_user? user
    user == current_user
  end

  delegate :suppervisor, to: :current_user

  def redirect_back_or default
    redirect_url = root_path
    unless default.nil?
      redirect_url = users_path
      redirect_url = suppervisor_users_path if default.suppervisor?
    end
    redirect_to session[:forwarding_url] || redirect_url
    session.delete :forwarding_url
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
