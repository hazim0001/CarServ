class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.admin ? scope.all : scope.where(user: user).order(created_at: :desc)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    raise
  end

  def update?
    raise
  end

  def destroy?
    raise
  end
end
