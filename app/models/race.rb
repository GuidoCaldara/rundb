class Race < ApplicationRecord
  belongs_to :organisation
  has_many :orders
  has_many :reviews
  has_many :users, through: :orders
  has_many :routes


  validates :name, :distance, :category, :date, :location, presence: true

end
