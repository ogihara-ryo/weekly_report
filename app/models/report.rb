class Report < ActiveRecord::Base
  paginates_per 3

  belongs_to :user
  has_many :comments
end
