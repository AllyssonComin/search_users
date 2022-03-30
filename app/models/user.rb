class User < ApplicationRecord
  # mount_uploader :picture, PictureUploader

  include PgSearch::Model
  pg_search_scope :search_user,
    against: [ :name, :gender, :email ],
    using: {
      tsearch: { prefix: true }
    }
end
