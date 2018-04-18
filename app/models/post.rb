class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  validates :product_name, {presence: true}
  validates :product_price, {presence: true}
  validates :product_score, {presence: true}

  scope :search_like, -> search { where('content like ?', "%#{search}%") if search.present? }
  scope :search_like, -> search { where('product_name like ?', "%#{search}%") if search.present? }

  def user
    return User.find_by(id: self.user_id)
  end

  def store
    return Store.find_by(id: self.store_category)
  end

end