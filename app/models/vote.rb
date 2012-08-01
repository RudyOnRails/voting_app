class Vote < ActiveRecord::Base
  
  attr_accessible :user, :question

  belongs_to :question
  belongs_to :user

end
