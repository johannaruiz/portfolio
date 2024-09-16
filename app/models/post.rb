# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  title       :string           not null
#  body        :text             not null
#  status      :int              not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string           not null
#

# Defines the Post model used for the blog
class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories

  before_save :generate_slug

  enum status: { draft: 0, published: 1 }

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug ||= title.parameterize
  end
end
