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
    user && ((record.expire && (user == record.customer || record.expire < Time.now)) || record.expire == nil)
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

  def book?
    user
  end
end
