class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to new_event_path
    else
      flash.now[:alert] = "This category already exists. Please try again."
      render :new
    end
  end



  def show
  end

  private

  def category_params
    params.require(:category).permit(:name )
  end
end
