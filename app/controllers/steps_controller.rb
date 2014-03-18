class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @steps = Step.where(list_id: @list.id)
  end

  def new
    @step = Step.new
  end

  def show
  end

  def edit
  end

  def create
    @list = List.find(params[:list_id])
    @step = Step.new(step_params)

    respond_to do |f|
      if @step.save
        f.html { redirect_to list_step_url(@list, @step), notice: 'Step was successfully created.' }
        f.json { render action: 'show', status: :created, location: @step }
      else
        f.html { render action: 'new' }
        f.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_step
      @step = Step.find(params[:id])
    end

    def step_params
      params.require(:step).permit(:title, :body)
    end
end
