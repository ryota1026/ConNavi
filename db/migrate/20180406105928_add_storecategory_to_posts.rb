class AddStorecategoryToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :store_category, :integer
  end
end
