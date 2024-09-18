# frozen_string_literal: true

# Functionality for Pages
class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by(slug: params[:slug])
    if @category
      @posts = @category.posts
      render 'posts/index'
    else
      redirect_to blog_categories_path, alert: t('categories.not_found')
    end
  end
end
