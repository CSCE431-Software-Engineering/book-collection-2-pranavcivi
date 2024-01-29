class AddDetailsToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :price, :decimal
    add_column :books, :published_date, :date
  end
end
