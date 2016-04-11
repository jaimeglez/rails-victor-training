class Article < ActiveRecord::Base
  belongs_to :user
  mount_uploader :img, ImgUploader
  validates :title, presence: true, length: { minimum: 5 }
  validates :user_id, presence: true
end
