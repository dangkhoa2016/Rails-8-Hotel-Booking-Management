class UserPolicy < ApplicationPolicy
  def index?
    user.admin? || user.manager?
  end

  def show?
    user.admin? || user.manager? || user == record
  end

  def create?
    user.admin? || user.manager?
  end

  def update?
    user.admin? || user.manager? || user == record
  end

  def destroy?
    (user.admin? || user.manager?) && user != record
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.manager?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end
end
