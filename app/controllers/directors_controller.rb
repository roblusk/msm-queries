class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")
    @the_director = Director.where({id: the_id})[0]
    @movies = Movie.where({ :director_id => @the_director.id})
    render({ :template => "director_templates/details"})
  end

  def show_youngest
    youngest_director = Director.where.not({ :dob => nil }).order({ :dob => :desc }).first
    @the_director = youngest_director
    @movies = Movie.where({ :director_id => @the_director.id})
    render({ :template => "director_templates/details"})
  end

  def show_eldest
    eldest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first
    @the_director = eldest_director
    @movies = Movie.where({ :director_id => @the_director.id})
    render({ :template => "director_templates/details"})
  end
end
