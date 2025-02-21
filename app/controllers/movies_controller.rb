class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create

    m = Movie.new
    m.title = params.fetch("movie_title")
    m.year = params.fetch("movie_year")
    m.description = params.fetch("movie_description")
    m.duration = params.fetch("movie_duration")
    m.director_id = params.fetch("movie_director_ID")
    m.image = params.fetch("movie_image")

    m.save

    redirect_to("/movies")
  end


end
