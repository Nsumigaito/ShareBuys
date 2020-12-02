class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 100}
  validates :value, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(word)
  	@posts = Post.where("body LIKE?", "%#{word}%")
  end
end
