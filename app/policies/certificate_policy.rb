class CertificatePolicy < ApplicationPolicy
  def index?
    true # All users can view their certificates
  end

  def show?
    user.admin? || record.user == user # Users can only see their own certificates
  end

  def create?
    user.present? # Any logged-in user can create certificates
  end

  def update?
    record.user == user # Only the owner can update their certificates
  end

  def destroy?
    record.user == user # Only the owner can delete their certificates
  end
  class Scope < Scope
    def resolve
      if user.is_admin
        scope.all
      else
        scope.none
      end
    end
  end
end
