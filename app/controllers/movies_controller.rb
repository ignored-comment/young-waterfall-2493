class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    if params[:name].present?
      actor = Actor.search(params[:name])
      Casting.create!(actor_id: actor.first.id, movie_id: @movie.id)
      render :show
    end
  end
end
