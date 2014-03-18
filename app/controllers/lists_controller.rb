class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def new
    @list = List.new(params[:step])
  end

  def create
    @list = List.new(list_params)

    @list.save
    redirect_to @list
  end

  def show
    @steps = Step.where(list_id: @list.id)
  end

  def index
    @lists = List.all
  end

private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :body)
  end
end
