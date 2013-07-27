class AddTotalPriceToTests < ActiveRecord::Migration
  def change
    add_column :tests, :total_price, :decimal
  end
end
