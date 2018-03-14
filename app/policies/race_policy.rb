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
    @organisation = Organisation.find(@record.organisation_id)
    @user.organisation && @organisation.user_id = @user.id
  end

  def edit?
    @organisation = Organisation.find(@record.organisation_id)
    @user.admin? || record.organisation_id == @user.organisation.id
  end

  def update?
    @organisation = Organisation.find(@record.organisation_id)
    @user.admin? || record.organisation_id == @user.organisation.id
  end

  def destroy?
    @organisation = Organisation.find(@record.organisation_id)
    @user.admin? || record.organisation_id == @user.organisation.id
  end


  class Scope < Scope
    def resolve
      scope
    end
  end



end
