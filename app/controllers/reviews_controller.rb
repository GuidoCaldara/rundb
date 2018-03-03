class ReviewsController < ApplicationController

  def create
    @review = Race.find(params[:race_id])
    @review = Race.new(race_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  def delete
  end

  def update
  end

end
