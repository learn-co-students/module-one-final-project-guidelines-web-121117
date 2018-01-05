class CreateMovieActors < ActiveRecord::Migration
  def change
    create_table :movie_actors do |ma|
      ma.references :movie
      ma.references :actor
    end
  end
end
