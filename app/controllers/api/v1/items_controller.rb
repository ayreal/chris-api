class Api::V1::ItemsController < ApplicationController

  def create
    item = Item.new(name: params[:name])
    list = List.find_by(id: params[:listId])
    list.items << item

      render json: list.with_items
  end

  def destroy
    byebug
    item = Item.find_by(id: params[:id])
    list = item.list
    item.destroy
      render json: list.with_items
  end
end
