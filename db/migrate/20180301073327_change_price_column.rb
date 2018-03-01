class ChangePriceColumn < ActiveRecord::Migration[5.1]
  def change
    add_monetize :races, :fee, currency: { present: false }
    add_monetize :races, :discount_fee, currency: { present: false }

  end
end
