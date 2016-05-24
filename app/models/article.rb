class Article < ActiveRecord::Base
  belongs_to :admin
  mount_uploader :img, ImgUploader
  validates :title, presence: true, length: { minimum: 5 }
  validates :admin_id, presence: true
end
