class Api::V1::ListsController < ApplicationController
  def index
    # get all lists for a particular user
    byebug
   @lists = List.all
   render json: @lists
 end

 def create
   list = List.new(name: params[:name])
   user = User.find_by(id: params[:userId])
   user.lists << list
   list.save!
   listIds = params[:listIds]

    if !listIds.empty?
      # combine all the items into an array
      # find unique w/ list.items.pluck(:id).uniq
      # add all into the new list
      newList = listIds.map do |id|
        l = List.find_by(id: id)
        l.items
      end
      newList = newList.flatten!.uniq
      newList.each { |i| list.items << i}
    end
    render json: list
 end

 def update
   # rename a list
   byebug
   list = List.find(params[:id])

   list.update(list_params)
   if list.save
     render json: list
   else
     render json: {errors: list.errors.full_messages}, status: 422
   end
 end

 def destroy
   # delete a list
   list = List.find_by(id: params[:id])
   user = list.user
   list.destroy
     render json: user.lists_with_items
 end

 private
 def list_params
   params.permit(:name, :items)
 end

end
