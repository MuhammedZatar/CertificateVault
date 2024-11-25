module CertificateAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :set_certificate, only: [:show, :edit, :update, :destroy]
  end

  private

  def set_certificate
    @certificate = Certificate.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Certificate not found."
    redirect_to root_path
  end
end
