class Issue < ActiveRecord::Base
  belongs_to :category
  belongs_to :language
  has_many :solutions
end
