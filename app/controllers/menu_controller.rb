class MenuController < ApplicationController
  def index
  	@sections = %w(Breakfast Lunch Dinner Drinks)
  	@orders = ["A->Z", "Date Ascending", "Date Descending"]
  	if (params[:order] == "Date Ascending")
  		@food_items = FoodItem.filter_by_section(params[:section]).order(created_at: :asc).page(params[:page]).per(5)
  	elsif (params[:order] == "Date Descending")
  		@food_items = FoodItem.filter_by_section(params[:section]).order(created_at: :desc).page(params[:page]).per(5)
  	else
  		@food_items = FoodItem.filter_by_section(params[:section]).order('name ASC').page(params[:page]).per(5)
  	end	
  end
end
