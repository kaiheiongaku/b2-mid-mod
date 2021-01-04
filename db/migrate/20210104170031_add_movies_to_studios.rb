class AddMoviesToStudios < ActiveRecord::Migration[5.2]
  def change
    add_reference :studios, :movies, foreign_key: true
  end
end
