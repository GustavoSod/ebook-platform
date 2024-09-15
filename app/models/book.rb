class Book < ApplicationRecord
  belongs_to :user
  mount_uploader :pdf, PdfUploader
  mount_uploader :image, ImageUploader
end
