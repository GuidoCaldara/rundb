class Organisation < ApplicationRecord
  mount_uploader :logo, PhotoUploader
  belongs_to :user
  has_many :races
  validates :name, uniqueness: true
  validates :name, :address, length: { maximum: 20 }
  validates :description, length: { maximum: 500 }
  validates :name, :description, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_format_of :phone_number, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
end



