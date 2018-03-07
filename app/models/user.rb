class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :orders
  has_many :races, through: :orders
  has_many :favorites
  has_many :reviews
  mount_uploader :avatar, PhotoUploader

  has_one :organisation
  validates :first_name, :last_name, :group, length: { maximum: 100 }
  geocoded_by :ip       # can also be an IP address
  after_validation :geocode


  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name   # assuming the user model has a name
      user.facebook_picture_url = auth.info.image # assuming the user model has an image

      # If you are using confirmable and the provider(s) you use validate emails,
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end


def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

def next_races
  @races = []
  @user = User.find(self.id)
  @orders = Order.where(user_id: @user.id, state: "paid")
  @orders.each do |order|
    @race = Race.find(order.race_id)
    if @race
      if @race.date >= Date.today && @race.date.year >= Date.today.year
        @races << @race
      end
    end
  end
  @races
end

def old_races
  @races = []
  @user = User.find(self.id)
  @orders = Order.where(user_id: @user.id, state: "paid")
  @orders.each do |order|
    @race = Race.find(order.race_id)
    if @race
      if @race.date < Date.today
        @races << @race
      end
    end
  end
  @races
end

def current_location
  Geocoder.search(request.ip)
end


end
