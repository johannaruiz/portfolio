# frozen_string_literal: true

# Defines the Inquiry model for user submitted messages
class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category

  validates :post_id, uniqueness: { scope: :category_id }

  scope :by_post, ->(post_id) { where(post_id:) }
  scope :by_category, ->(category_id) { where(category_id:) }
end
