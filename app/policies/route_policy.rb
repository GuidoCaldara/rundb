class RoutePolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    route
  end

  def create?
    route
  end

  def manage?
    route
  end


  def destroy?
    route
  end

private

  def route
    @race = Race.find(@record.race_id)
    @organisation = Organisation.find(@race.organisation_id)
    @user.admin? || @user.id == @organisation.user_id
  end

end
