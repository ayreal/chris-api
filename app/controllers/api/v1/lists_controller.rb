class Api::V1::ListsController < ApplicationController
  def index
    # get all lists for a particular user
    byebug
   @lists = List.all
   render json: @lists
 end

 def update
   # rename a list
   byebug
   @list = List.find(params[:id])

   @list.update(list_params)
   if @list.save
     render json: @list
   else
     render json: {errors: @list.errors.full_messages}, status: 422
   end
 end

 def destroy
   # delete a list
   byebug
 end

 private
 def list_params
   params.permit(:name, :items)
 end

end
