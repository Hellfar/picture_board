class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    false
  end

  def show?
    user
  end

  def create?
    true
  end

  def update?
    user == record
  end

  def destroy?
    user == record
  end
end
