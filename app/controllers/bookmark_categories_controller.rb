class BookmarkCategoriesController < ApplicationController
  before_action :set_bookmark_category, only: [:show, :update, :destroy]

  # GET /bookmark_categories
  def index
    @bookmark_categories = BookmarkCategory.all

    render json: @bookmark_categories
  end

  # GET /bookmark_categories/1
  def show
    render json: @bookmark_category
  end

  # POST /bookmark_categories
  def create
    @bookmark_category = BookmarkCategory.new(bookmark_category_params)

    if @bookmark_category.save
      render json: @bookmark_category, status: :created, location: @bookmark_category
    else
      render json: @bookmark_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmark_categories/1
  def update
    if @bookmark_category.update(bookmark_category_params)
      render json: @bookmark_category
    else
      render json: @bookmark_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookmark_categories/1
  def destroy
    @bookmark_category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark_category
      @bookmark_category = BookmarkCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookmark_category_params
      params.fetch(:bookmark_category, {})
    end
end
