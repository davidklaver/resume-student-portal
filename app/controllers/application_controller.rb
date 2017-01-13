class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
     @current_user ||= Student.find_by(id: session[:student_id]) if session[:student_id]
  end
  helper_method :current_user
end
