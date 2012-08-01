class Question < ActiveRecord::Base
  attr_accessible :title, :user_id

  validates :title, :presence => true

  belongs_to :parent
  belongs_to :user
  has_many :votes

  def vote(user)
    self.votes << Vote.new(user: user)
  end

  def score()
    self.votes.count
  end

end