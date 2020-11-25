class UserSkillPolicy < ApplicationPolicy

  def new?
    create?
  end

  def show?
    true
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

  def owner?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
