class RoomPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin? || user.manager?
  end

  def update?
    user.admin? || user.manager?
  end

  def destroy?
    user.admin? || user.manager?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
