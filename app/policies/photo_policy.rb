class PhotoPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    photo_policy
  end

  def create?
    photo_policy
  end

  def manage?
    photo_policy
  end


  def destroy?
    photo_policy
  end

private

  def photo_policy
    @race = Race.find(@record.race_id)
    @organisation = Organisation.find(@race.organisation_id)
    @user.admin? || @user.id == @organisation.user_id
  end

end
