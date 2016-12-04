class Post < ActiveRecord::Base
  belongs_to :updater, class_name: 'User'
end
