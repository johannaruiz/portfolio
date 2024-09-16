# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string           not null
#

# Defines the Category model associated with Posts
class Category < ApplicationRecord
  # has_many :comments, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories
  before_validation :generate_slug

  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug ||= name.parameterize
  end
end
