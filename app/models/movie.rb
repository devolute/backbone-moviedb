class Movie < ActiveRecord::Base
  attr_accessible :title, :description, :category

  acts_as_rateable
  
  def as_json(options)
    hash = attributes.merge({average_rating: average_rating_round})
    if current_user && (rating = rated_by?(current_user))
      hash = hash.merge({my_rating: rating.rate.score})
    end
    hash
  end
 
  def current_user
    User.current_user 
  end

end
