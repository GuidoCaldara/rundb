class UserPolicy

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    true
  end


  def destroy?
    true
  end

private

end
