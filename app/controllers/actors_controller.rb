class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render({ :template => "actor_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    @the_actor = Actor.where({ :id => the_id })[0]
    @the_actor_characters = Character.where({ :actor_id => @the_actor.id })
    render({ :template => "actor_templates/details"})
  end
end
