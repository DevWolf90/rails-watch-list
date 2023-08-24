class ListsController < ApplicationController

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
    # @bookmarks = @list.bookmark.all
    # @bookmark = @bookmarks.find_by_id(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render 'lists', status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
