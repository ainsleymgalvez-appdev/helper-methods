class MoviesController < ApplicationController
 
  def new
    @movie = Movie.new
  end

  def index

    @movies = Movie.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html do
        render template: "movies/index"
      end
    end
  end

  def show
    
    @movie = Movie.find(params.fetch(:id))

  end

  # LEFT OFF 30:18

  def create
    movie_attributes = params.require(:movie).permit(:title, :description)

    @movie = Movie.new(movie_attributes)
    
    if @movie.valid?
      @movie.save
      redirect_to(movies_url, notice: "Movie created successfully.")
    else
      render template: "new"
    end
  end

  def edit
    @movie = Movie.find(params.fetch(:id))
  end

  def update
    movie = Movie.find( params.fetch(:id) )

    movie.title = params.fetch(:title)
    movie.description = params.fetch(:description)

    if movie.valid?
      movie.save
      redirect_to(movie_url(movie), notice: "Movie updated successfully." )
    else
      redirect_to(movie_url(movie), alert: "Movie failed to update successfully.")
    end
  end

  def destroy
    movie = Movie.find( params.fetch(:id) )

    movie.destroy

    redirect_to(movies_url, notice: "Movie deleted successfully." )
  end
end
