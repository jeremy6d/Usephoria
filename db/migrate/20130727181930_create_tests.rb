class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :type
      t.text :question
      t.string :demographics
      t.decimal :price
      t.integer :number_of_users

      t.timestamps
    end
  end
end
