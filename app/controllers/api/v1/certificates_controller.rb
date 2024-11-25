module Api
  module V1
    class CertificatesController < BaseController
      before_action :authenticate_user!
      after_action :verify_authorized, :except => :index, unless: :devise_controller?

      # List certificates accessible to the user
      def index
        @certificates = policy_scope(Certificate)
        render json: @certificates
      end

      # Create a new certificate
      def create
        @certificate = current_user.certificates.build(certificate_params)
        authorize @certificate
        if @certificate.save
          render json: @certificate, status: :created
        else
          render json: { errors: @certificate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # Update an existing certificate
      def update
        @certificate = Certificate.find(params[:id])
        authorize @certificate
        if @certificate.update(certificate_params)
          render json: @certificate, status: :ok
        else
          render json: { errors: @certificate.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # Delete a certificate
      def destroy
        @certificate = Certificate.find(params[:id])
        authorize @certificate
        @certificate.destroy
        head :no_content
      end

      private

      def certificate_params
        params.require(:certificate).permit(:name, :domain, :file_path)
      end
    end
  end
end
