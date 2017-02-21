class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user
  end

  def show?
    user
  end

  def create?
    user
  end

  def update?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
