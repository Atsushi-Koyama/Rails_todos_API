# app/models/item.rb
class Item < ApplicationRecord
  # model associaton
  belongs_to :todo

  #validation
  validates_presence_of :name
end
