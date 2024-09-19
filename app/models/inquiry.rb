# frozen_string_literal: true

# Defines the Inquiry model for user submitted messages
class Inquiry < ApplicationRecord
  enum :type, { basic: 0, employment: 1 }
end
