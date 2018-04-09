class RoutePolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    route_policy
  end

  def callback?
   route_policy
  end

  def show?
    @race = Race.find(@record.race_id)
    if @race.route != nil
      route_policy
    end
  end

  def create?
    route_policy
  end

  def manage?
    route_policy
  end


  def destroy?
    route_policy
  end

private

  def route_policy
    @race = Race.find(@record.race_id)
    @organisation = Organisation.find(@race.organisation_id)
    @user.admin? || @user.id == @organisation.user_id
  end

end
