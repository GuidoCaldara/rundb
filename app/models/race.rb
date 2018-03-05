class Race < ApplicationRecord
  before_create :set_sku, :define_fee
  has_one :route
  belongs_to :organisation
  has_many :orders
  has_many :reviews
  has_many :users, through: :orders
  has_many :routes
  has_many :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include AlgoliaSearch

  algoliasearch do
    attribute :name, :location, :category, :distance, :date_stamp, :_geoloc, :id, :reviews, :race_avg_rate
    attributesForFaceting [:category, :distance, :date_stamp, :_geoloc, :name, :location, :id]

  end
  monetize :fee_cents
  monetize :discount_fee_cents


  # validates :name, :distance, :category, :date, :location, presence: true

  def define_fee
    self.fee_cents = self.fee_cents * 100
    if self.discount_fee_cents
      self.discount_fee_cents = self.discount_fee_cents * 100
  end

  end

  def has_order?
    if Order.where(race_id:self.id)
       true
    else
       false
    end
  end

  def set_sku
    self.sku = loop do
      random_token = SecureRandom.urlsafe_base64(5)
      break random_token unless Race.exists?(sku: random_token)
    end
  end

  def race_avg_rate
    # self.race_avg_rate = self.reviews.pluck(:avg_rate).compact.sum / self.reviews.size
    # self.save
    if self.reviews.size > 0
      rate_sum = 0
      race_average = 0
      self.reviews.each do |review|
       rate_sum += review.avg_rate
      end
      race_average = (rate_sum / self.reviews.size)
      return race_average.to_i
      self.save
    end
  end

end


