class BookingPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
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
