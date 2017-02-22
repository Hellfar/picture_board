class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user
  end

  def show?
    user && ((record.expire && (user == User.find(record.customer) || !(record.booked?))) || record.expire == nil)
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
