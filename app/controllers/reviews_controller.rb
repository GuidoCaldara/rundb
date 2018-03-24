class ReviewsController < ApplicationController

  def show
    @reviews = Review.all
  end

  def create
    raise
    @race = Race.find(params[:race_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.race_id = @race.id
    authorize @review
     if @review.save
      respond_to do |format|
        format.html { redirect_to race_path(@race) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render partial: 'race/show' }
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
