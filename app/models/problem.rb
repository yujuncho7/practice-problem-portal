class Problem < ActiveRecord::Base
  attr_accessible :title, :category, :difficulty, :description, :solution, :tag_list
  acts_as_taggable


end
