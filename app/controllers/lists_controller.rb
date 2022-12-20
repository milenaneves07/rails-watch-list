class ListsController < ApplicationController
  before_action :set_list, only: %i[show]

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def restaurant_params
    params.require(:list).permit(:name)
  end
end
