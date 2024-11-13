# frozen_string_literal: true

#
# == Schema Information
#
# Table name: categories
#
#  name        :string           not null
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#
# Defines the Category associated with Posts (Blog Posts)
class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category

  validates :post_id, uniqueness: { scope: :category_id }

  scope :by_post, ->(post_id) { where(post_id:) }
  scope :by_category, ->(category_id) { where(category_id:) }
end
