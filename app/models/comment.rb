# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id          :bigint           not null, primary key
#  body        :text             not null
#  approved    :boolean          not null, default: false
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_categories_on_name
#  index_categories_on_slug

# Defines the comment model associated with posts
class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true, inverse_of: :replies
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy, inverse_of: :parent

  validates :body, presence: true
  validates :approved, inclusion: { in: [true, false] }

  scope :approved, -> { where(approved: true) }
  scope :pending, -> { where(approved: false) }
end
