class Post < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_many :notifications, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(word)
  	@posts = Post.where("body LIKE?", "%#{word}%")
  end
end
