class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds, only: [:name, :species]
  end

  # POST /birds
  def create
    bird = Bird.create(params.permit(:name, :species))
    render json: bird, only: [:name, :species], status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, only: [:name, :species]
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

end
