# frozen_string_literal: true

# Helper methods for the entire application
module ApplicationHelper
  def flash_type_class
    flash[:error].present? ? 'error' : 'notice'
  end
end
