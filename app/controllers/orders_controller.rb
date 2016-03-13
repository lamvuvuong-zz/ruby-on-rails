class OrdersController < ApplicationController
	def create
    @food_item = FoodItem.find(params[:food_item_id])
    @order = @food_item.orders.create(order_params)
    redirect_to food_item_path(@food_item)
  end
  def destroy
	    @food_item = FoodItem.find(params[:food_item_id])
	    @order = @food_item.orders.find(params[:id])
	    @order.destroy
	    redirect_to food_item_path(@food_item)
	end
	def show
		@order = Order.find_by id: params[:id]
  	end	
 
  private
    def order_params
      params.require(:order).permit(:name, :phone_number, :address, :quantity)
    end
end
