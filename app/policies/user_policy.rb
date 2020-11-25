class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit
    update?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  def owner?
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
