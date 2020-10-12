class Post < ApplicationRecord
  has_many :collections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  belongs_to :user
end
