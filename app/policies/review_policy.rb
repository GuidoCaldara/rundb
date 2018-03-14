class ReviewPolicy < ApplicationPolicy

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


  def create?
    true
    # @race = Race.find(@record.race_id)
    # @reviews = Review.where(race_id: @race.id)
    # @user_reviews = @reviews.where(user_id = @user.id)
    # user.admin? || !@user_reviews
  end



  class Scope < Scope
    def resolve
      scope
    end
  end



end
