class StudiosController < ApplicationController

  def show
    @studio = Studio.find(params[:id])
    @studio_actors = Actor.unique_and_ordered_by_age_working_true
  end
end
