class Review < ApplicationRecord
  belongs_to :user
  belongs_to :race
  before_save :set_avg_rate

  def set_avg_rate
    self.avg_rate = ((self.route_rate.to_f + self.organisation_rate.to_f + self.value_for_money.to_f) / 3)
  end
end
