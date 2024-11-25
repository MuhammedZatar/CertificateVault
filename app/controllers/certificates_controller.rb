class CertificatesController < ApplicationController
  before_action :authenticate_user!

  def index
    @certificates = current_user.certificates # Ensures only certificates belonging to the user are shown
  end

  def new
    @certificate = current_user.certificates.build
  end

  def create
    @certificate = current_user.certificates.build(certificate_params)
    if @certificate.save
      redirect_to certificates_path, notice: 'Certificate created successfully.'
    else
      render :new
    end
  end

  def edit
    @certificate = current_user.certificates.find(params[:id]) # Ensures the user can only edit their own certificates
  end

  def update
    @certificate = current_user.certificates.find(params[:id])
    if @certificate.update(certificate_params)
      redirect_to certificates_path, notice: 'Certificate updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @certificate = current_user.certificates.find(params[:id])
    @certificate.destroy
    redirect_to certificates_path, alert: 'Certificate deleted successfully.'
  end

  private

  def certificate_params
    params.require(:certificate).permit(:name, :domain, :file_path)
  end
end
