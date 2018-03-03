class Race < ApplicationRecord
  before_create :set_sku, :define_fee

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
    attribute :name, :location, :category, :distance, :date_stamp, :_geoloc, :id
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

end
