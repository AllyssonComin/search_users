class User < ApplicationRecord
  # mount_uploader :picture, PictureUploader
  has_one_attached :photo
  
  include PgSearch::Model
  pg_search_scope :search_user,
    against: [ :name, :gender, :email ],
    using: {
      tsearch: { prefix: true }
    }
end
