class ChangePostsColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :product_name, :string
    add_column :posts, :product_image, :string
    add_column :posts, :product_price, :integer
  end
end
