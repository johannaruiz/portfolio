# frozen_string_literal: true

# Functionality for Pages
class PagesController < ApplicationController
  def home; end

  # def about; end

  # def contact; end

  def show
    render params[:action]
  end
end
