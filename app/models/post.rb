class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
  validates :product_name, {presence: true}
  validates :product_price, {presence: true}
  validates :product_score, {presence: true}
  validates :store_category, {presence: true}

  scope :search_like, -> search { where('content like ? or product_name like ?', "%#{search}%","%#{search}%") if search.present? }

  def user
    return User.find_by(id: self.user_id)
  end

  def store
    return Store.find_by(id: self.store_category)
  end

end