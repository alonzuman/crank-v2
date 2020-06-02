class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def discover?
    return true
  end
  
  def feed?
    return true
  end

  def create?
    return true
  end
  
  def new?
    create?
  end

  def destroy?
    record.user == user
  end
end
