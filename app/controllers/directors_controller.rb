class DirectorsController < ApplicationController

  def new
    @director = Director.new
  end

  def index
    @directors = Director.order(name: :asc)

    respond_to do |format|
      format.json do 
        render json: @directors
      end

      format.html do 
        render template: "directors/index"
      end
    end
  end

  def show
    @director = Director.find(params.fetch(:id))
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob)

    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to(directors_url, notice: "Director created successfully.")
    else
      render template: "new"
    end
  end

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    director = Director.find(params.fetch(:id))

    director.name = params.fetch(:name)
    director.dob = params.fetch(:dob)

    if director.valid?
      director.save
      redirect_to(director_url(director), notice: "Director updated successfully.")
    else
      redirect_to(director_url(director), alert: "Director failed to update successfully.")
    end
  end

  def destroy
    director = Director.find(params.fetch(:id))
    director.destroy

    redirect_to(directors_url, notice: "Director deleted successfully.")
  end

  end