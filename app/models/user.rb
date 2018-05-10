class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  scope :name_like, -> name {
  where('name like ?', "%#{name}%") if name.present?
  }

  def posts
    return Post.where(user_id: self.id)
  end
end
