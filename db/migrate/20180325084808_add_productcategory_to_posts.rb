class AddProductcategoryToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :product_category, :integer
  end
end
