class FixColumnNameToReviewTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :reviews, :organization_rate, :organisation_rate
  end
end
