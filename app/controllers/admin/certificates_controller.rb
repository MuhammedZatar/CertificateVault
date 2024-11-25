module Admin
  class CertificatesController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    def index
      @users = User.all
      @certificates = policy_scope(Certificate)
    end

    def edit
      @certificate = Certificate.find(params[:id])
    end

    def update
      @certificate = Certificate.find(params[:id])
      if @certificate.update(certificate_params)
        redirect_to admin_certificates_path, notice: 'Certificate updated successfully.'
      else
        render :edit
      end
    end

    def destroy
      @certificate = Certificate.find(params[:id])
      @certificate.destroy
      redirect_to admin_certificates_path, alert: 'Certificate deleted successfully.'
    end

    private

    def require_admin
      authorize :certificate, :index? # This checks the `index?` method in CertificatePolicy
    rescue Pundit::NotAuthorizedError
      flash[:alert] = "You are not authorized to access this page."
      redirect_to main_app.authenticated_root_path
    end

    def certificate_params
      params.require(:certificate).permit(:name, :domain, :file_path)
    end
  end
end
