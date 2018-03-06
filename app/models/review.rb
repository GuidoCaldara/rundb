class Review < ApplicationRecord
  belongs_to :user
  belongs_to :race
  before_save :set_avg_rate

  validates :route_rate, :organisation_rate, :value_for_money, numericality: { less_than_or_equal_to: 10,  only_integer: true }
  validates :description, :route_rate, :organisation_rate, :value_for_money, presence: true
  validates :description, length: { in: 20..400 }




  def set_avg_rate
    self.avg_rate = ((self.route_rate.to_f + self.organisation_rate.to_f + self.value_for_money.to_f) / 3)
    self.race.set_race_avg_rate
  end
end
