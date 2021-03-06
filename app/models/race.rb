class Race < ApplicationRecord
  before_create :set_sku
  # before_create :define_fee,
  mount_uploader :photo, PhotoUploader
  mount_uploader :pathimg, PhotoUploader
  has_one :route
  belongs_to :organisation
  has_many :orders
  has_many :reviews, dependent: :destroy
  has_many :users, through: :orders
  has_many :routes
  has_many :photos, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  #validation form
  validates :name, :race_distance, :category, :date, :location, presence: true
  validates :name, uniqueness: true
  validates :name, :location, :category , :website, :subscription_link, :starting_point, :video, length: { maximum: 100 }
  validates :description, :goodies, length: {maximum: 1200}
  validates :photo, presence: true, on: :create
  validates :race_distance, :elevation, :fee_cents, numericality: { less_than_or_equal_to: 15000,  only_integer: true }
  validates :name, :race_distance, :date, :category, :location, :description, :first_edition, :starting_point, :fee_cents, presence: true
  validate :race_date_in_the_future?
  validate :elevation_check
  validate :special_price_check
  validate :special_price_date_check
  validate :check_price
  validate :check_subscription_link


  def race_date_in_the_future?
    if date < Date.today
      errors.add :date, "Race Date must be in the future!"
    end
  end

  def special_price_check
    if discount_fee_cents && discount_fee_cents == 0
      discount_fee_cents == nil
    end
  end

  def elevation_check
   if category != "Road" && !elevation
    errors.add :elevation, "Elevation must be present for outdoor running"
  end
end

def special_price_check
  if discount_fee_cents
    if discount_fee_cents == true && !discount_fee_finish
      errors.add :discount_fee_finish, "Please insert the last day of your special price"
    end
  end
end

def special_price_date_check
  if discount_fee_finish
    if discount_fee_finish > subscription_end
      errors.add :discount_fee_finish, "The discount fee finish can't be after the subscription end date!"
    elsif discount_fee_finish < subscription_start
      errors.add :discount_fee_finish, "The discount fee finish can't be before the start of the subscription!"
    end
  end
end

def check_price
  if discount_fee_cents
    if discount_fee_cents >= fee_cents
      errors.add :discount_fee_cents, "The discount price can't be bigger or equal than the normal price"
    end
  end
end

def check_subscription_link
  if !bookable && subscription_start < Date.today
    if !subscription_link
      errors.add :subscription_link, "The subscription for your race seems open! Please provide a valid link for the registration process"
    end
  end
end


include AlgoliaSearch

algoliasearch do
  attribute :name, :location, :category, :race_distance, :date_stamp, :_geoloc, :id, :race_avg_rate
  attribute :photo_url do
    if photo.metadata
      if photo.metadata["secure_url"]
        "#{photo.metadata["secure_url"]}"
      end
    elsif !photo.file.nil?
      self.photo_url
    end
  end
  attributesForFaceting [:category, :race_distance, :date_stamp, :_geoloc, :name, :location, :id ]

end




monetize :fee_cents
monetize :discount_fee_cents


  def has_reviewed?(current_user)
    self.reviews.where(user: current_user).any?
  end

  def has_order?
   Order.where(race_id:self.id).any?
 end

 def set_sku
  self.sku = loop do
    random_token = SecureRandom.urlsafe_base64(5)
    break random_token unless Race.exists?(sku: random_token)
  end
end


# Computation of the route average rate
def set_route_rate_avg
  if self.reviews.size > 0
    route_rate_sum = 0
    route_rate_avg = 0
    self.reviews.each do |review|
     route_rate_sum += review.route_rate
   end
   self.route_rate_avg = (route_rate_sum.to_f / self.reviews.size.to_f)
   self.save
 end
end


# Computation of the organisation average rate

def set_organisation_rate_avg
  if self.reviews.size > 0
    organisation_rate_sum = 0
    organisation_rate_avg = 0
    self.reviews.each do |review|
     organisation_rate_sum += review.organisation_rate
   end
   self.organisation_rate_avg = (organisation_rate_sum.to_f / self.reviews.size.to_f)
   self.save
 end
end

# Computation of the value for money average rate


def set_value_for_money_avg
  if self.reviews.size > 0
    value_for_money_sum = 0
    value_for_money_avg = 0
    self.reviews.each do |review|
     value_for_money_sum += review.value_for_money
   end
   self.value_for_money_avg = (value_for_money_sum.to_f / self.reviews.size.to_f)
   self.save
 end
end



# computation of the race OVERALL average rate

def set_race_avg_rate

    # self.race_avg_rate = self.reviews.pluck(:avg_rate).compact.sum / self.reviews.size
    # self.save
    if self.reviews.size > 0
      rate_sum = 0
      race_average = 0
      self.reviews.each do |review|
       rate_sum += review.avg_rate
     end
     self.race_avg_rate = (rate_sum / self.reviews.size).to_i
     self.save
   end
 end


end
