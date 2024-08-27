# frozen_string_literal: true

# Defines the Inquiry model for user submitted messages
class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category
end
