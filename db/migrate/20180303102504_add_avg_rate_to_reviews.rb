class AddAvgRateToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :avg_rate, :float
  end
end
