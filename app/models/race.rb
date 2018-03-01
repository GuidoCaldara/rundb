class Race < ApplicationRecord
  belongs_to :organisation
  has_many :orders
  has_many :reviews
  has_many :users, through: :orders
  has_many :routes

  validates :name, :distance, :category, :date, :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  include AlgoliaSearch

  algoliasearch do

  attributesForFaceting [:location, :date, :category, :distance]

  end


end
