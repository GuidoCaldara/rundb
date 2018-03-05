class ReviewsController < ApplicationController

  def create
    @race = Race.find(params[:race_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.race_id = @race.id
     if @review.save
      respond_to do |format|
        format.html { redirect_to race_path(@race) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'race/show' }
        format.js
      end
    end

  end

  def update
  end

  def destroy
  end

  def review_params
    params.require(:review).permit(:description, :route_rate, :organisation_rate, :value_for_money)
  end

end
