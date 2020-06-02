class FollowPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def follow?
    return true
  end

  def unfollow?
    return true
  end
end
