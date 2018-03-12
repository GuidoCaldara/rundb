class OrganisationPolicy < ApplicationPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin?
  end

  def show?
    true
  end

  def new?
    user.admin? || !user.organisation
  end

  def create?
    user.admin? || !user.organisation
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
