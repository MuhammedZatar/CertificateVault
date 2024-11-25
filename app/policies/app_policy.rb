
class AppPolicy < ApplicationPolicy
  def index?
    user.is_developer? || user.is_admin?
  end

  def create?
    user.is_developer? || user.is_admin?
  end

  def new?
    create?
  end

  def show?
    record.user == user || user.is_admin?
  end

  def update?
    record.user == user || user.is_admin?
  end

  def destroy?
    record.user == user || user.is_admin?
  end

  class Scope < Scope
    def resolve
      if user.is_admin?
        scope.all # Admin can see all apps
      elsif user.is_developer?
        scope.where(user: user) # Developers can see their apps
      else
        scope.none # No access for other users
      end
    end
  end
end
