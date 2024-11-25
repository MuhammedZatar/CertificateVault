class Developer::AppsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_developer

  def index
    @apps = policy_scope(App)
    authorize @apps
  end

  def new
    @app = App.new
    authorize @app
  end

  def create
    @app = current_user.apps.build(app_params)
    authorize @app

    if @app.save
      redirect_to developer_apps_path, notice: "App created successfully!"
    else
      render :new, alert: "Failed to create app."
    end
  end

  def edit
    @app = App.find(params[:id])
    authorize @app
  end
  
  def update
    @app = App.find(params[:id])
    authorize @app
  
    if @app.update(app_params)
      redirect_to developer_apps_path, notice: "App updated successfully!"
    else
      render :edit, alert: "Failed to update app."
    end
  end
  

  private

  def app_params
    params.require(:app).permit(:name, :description)
  end

  def require_developer
    unless current_user.is_developer? || current_user.is_admin?
      flash[:alert] = "You are not authorized to access this page."
      redirect_to main_app.authenticated_root_path
    end
  end
end
