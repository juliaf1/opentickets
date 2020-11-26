class TicketPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    record.timeslot.user != user
  end

  def destroy?
    owner? || record.timeslot.user == user
  end

  def owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
