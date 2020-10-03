class Tool < ActiveHash::Base
  self.data = [
    { id: 1, name: 'zoom', image: 'https://app-story.net/wp-content/uploads/2020/06/SnapCrab_NoName_2020-3-30_22-37-13_No-00.png' },
    { id: 2, name: 'skype', image: 'https://cdn.worldvectorlogo.com/logos/skype-3.svg' },
    { id: 3, name: 'whereby', image: 'https://www.itreview.jp/rails/active_storage/blobs/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBNHBTQVE9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--f0f7eb4e9f0eb004e8f64d95100b037bffd705aa/Whereby.png' }
  ]
  include ActiveHash::Associations
  has_many :studies
end
