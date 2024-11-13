# frozen_string_literal: true

# Global Helper Methods
module ApplicationHelper
  def flash_type_class
    flash[:error].present? ? 'error' : 'notice'
  end
end
