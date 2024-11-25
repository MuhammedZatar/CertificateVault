class Api::BaseController < ActionController::API
  include Pundit

  before_action :authenticate_with_token!

  private

  def authenticate_with_token!
    token = request.headers["Authorization"]&.split(" ")&.last || params[:access_token]
    @current_user = User.joins(:apps).find_by(apps: { access_token: token })

    render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
  end
end
