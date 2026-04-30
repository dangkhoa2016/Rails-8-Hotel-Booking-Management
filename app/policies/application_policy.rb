# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    manager_or_admin?
  end

  def show?
    manager_or_admin?
  end

  def create?
    manager_or_admin?
  end

  def new?
    create?
  end

  def update?
    manager_or_admin?
  end

  def edit?
    update?
  end

  def destroy?
    manager_or_admin?
  end

  private

  def admin?
    user&.admin?
  end

  def manager_or_admin?
    admin? || user&.manager?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define a resolve method in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
