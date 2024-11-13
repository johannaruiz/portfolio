# frozen_string_literal: true

# Actions and Request Methods for Pages
class PagesController < ApplicationController
  def home
    @inquiry = Inquiry.new
  end

  # def about; end

  # def contact; end

  def show
    render params[:action]
  end
end
