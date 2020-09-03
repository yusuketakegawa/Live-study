class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: 'がっつり勉強'}, 
    {id: 2, name: 'ゆるりと勉強'}, 
    {id: 3, name: '少し休憩'}
  ]
  include ActiveHash::Associations
  has_many :studies
end
