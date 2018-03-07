class Order < ApplicationRecord
  belongs_to :user
  belongs_to :race
  monetize :amount_cents
  # validates :first_name, :last_name, :gender, :city, :date_of_birth, presence: true
  # validates :first_name, :last_name, :gender, :city, length: { maximum: 100 }
end


