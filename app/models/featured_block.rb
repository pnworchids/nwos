class FeaturedBlock < ActiveRecord::Base

  mount_uploader :image, FeaturedUploader

  validates :title, :description, :weight, presence: true
end
