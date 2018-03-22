class User < ApplicationRecord
  has_secure_password
  validates :name, {presence: true}
  validates :email, {presence: true,uniqueness: true}

  scope :name_like, -> name {
  where('name like ?', "%#{name}%") if name.present?
  }

  def posts
    return Post.where(user_id: self.id)
  end
end
