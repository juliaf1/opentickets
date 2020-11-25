class TimeslotPolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    owner?
  end

  def destroy?
    owner?
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
