class Organisation < ApplicationRecord
  belongs_to :user
  has_many :races
end
