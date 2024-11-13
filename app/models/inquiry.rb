# frozen_string_literal: true

# == Schema Information
#
# Table name: inquiries
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  email       :string           not null
#  message     :text             not null
#  kind        :int              not null, default: 0
#  phone       :string
#  company     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string           not null
#

# Defines the Inquiry model for user submitted messages
class Inquiry < ApplicationRecord
  before_save :sanitize_text_attributes

  validates :name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone,
            format: { with: /\A(\+?\d{1,4}[-.\s]?)?(\(?\d{1,3}\)?[-.\s]?)?\d{1,4}[-.\s]?\d{1,4}[-.\s]?\d{1,9}\z/ },
            allow_nil: true
  enum :kind, { basic: 0, employment: 1 }

  private

  def sanitize_text_attributes
    attributes.each do |attr, value|
      self[attr] = ActionView::Base.full_sanitizer.sanitize(value) if value.is_a?(String)
    end
  end
end
