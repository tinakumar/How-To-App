class List < ActiveRecord::Base
  #attr_accessible :name, :author, :description

  has_many :steps
end
