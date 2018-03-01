class Order < ApplicationRecord
  belongs_to :user
  belongs_to :race
  monetize :amount_cents

end
