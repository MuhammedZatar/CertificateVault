class Api::V1::ResourcesController < Api::BaseController
  def index
    render json: { message: "Access granted to #{@current_user.email}" }
  end
end
