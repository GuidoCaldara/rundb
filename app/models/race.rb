class Race < ApplicationRecord
  before_create :sku_generator, :define_fee

  belongs_to :organisation
  has_many :orders
  has_many :reviews
  has_many :users, through: :orders
  has_many :routes

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

  def sku_generator
    self.sku = loop do
    random_token = SecureRandom.urlsafe_base64(5)
    break random_token unless Race.exists?(sku: random_token)
    end
  end

end
