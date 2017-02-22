class PagePolicy < ApplicationPolicy
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
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
