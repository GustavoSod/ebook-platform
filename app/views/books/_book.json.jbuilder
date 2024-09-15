json.extract! book, :id, :title, :description, :user_id, :pdf, :image, :created_at, :updated_at
json.url book_url(book, format: :json)
