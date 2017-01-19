module AccessControl
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
    helper_method :current_user, :logged_in?
  end

  def login
    require_login
  end

  def logout
    render status: :unauthorized
  end

  protected

  def set_current_user
    @current_user = authenticate_with_http_basic do |username, password|
      user = User.where(username: username).first
      user && user.authenticate?(password) ? user : nil
    end
    true # login migh not be required
  end

  def current_user
    @current_user
  end

  def logged_in?
    @current_user.present?
  end

  def require_login
    if logged_in?
      redirect_to root_path
    else
      request_http_basic_authentication
    end
  end
end
