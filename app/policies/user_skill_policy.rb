class UserSkillPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    owner?
  end

  def edit?
    update?
  end

  def update?
    owner?
  end

  def destroy?
    record.user == user
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
