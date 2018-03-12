class RacePolicy < ApplicationPolicy

  def initialize(user, record)
     @user = user
     @record = record
   end

  def index?
     true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    user.admin? || record.user == user
  end

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end


  class Scope < Scope
    def resolve
      scope
    end
  end



end
