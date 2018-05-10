class Store < ApplicationRecord
  belongs_to :posts
    def selects
      return Store.all
    end
end
