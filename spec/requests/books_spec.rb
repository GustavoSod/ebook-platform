require 'rails_helper'

RSpec.describe "/books", type: :request do

  describe "GET /index" do
    it "render books to user" do
      writer = create(:user, role: 'writer')
      sign_in writer
      book = create(:book, user: writer)

      get books_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      writer = create(:user, role: 'writer')
      sign_in writer
      book = create(:book, user: writer)
  
      get book_path(book)  # Use book_path e passe o livro
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end  

  describe "GET /new" do
    it "new book to writer" do
      writer = create(:user, role: 'writer')
      sign_in writer
      book = create(:book, user: writer)

      get new_book_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      writer = create(:user, role: 'writer')
      sign_in writer
      book = create(:book, user: writer)

      get edit_book_path(book)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new book for writer" do
        writer = create(:user, role: 'writer')
        sign_in writer
        valid_params = { book: { title: 'New Book', description: 'Book description', user_id: writer.id } }

        expect {
          post books_path, params: valid_params
        }.to change(Book, :count).by(1)

        expect(response).to have_http_status(302)  # Should redirect
        expect(response).to redirect_to(book_path(Book.last))
      end
    end
  end
  
  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the book for the writer who owns it" do
        writer = create(:user, role: 'writer')
        sign_in writer
        book = create(:book, user: writer)
        valid_params = { book: { description: 'Updated description' } }
  
        patch book_path(book), params: valid_params
        book.reload
  
        expect(book.description).to eq('Updated description')
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(book_path(book))
      end
    end
  end
  
  describe "DELETE /destroy" do
    it "destroys the book for the writer who owns it" do
      writer = create(:user, role: 'writer')
      sign_in writer
      book = create(:book, user: writer)

      expect {
        delete book_path(book)
      }.to change(Book, :count).by(-1)

      expect(response).to have_http_status(302)
      expect(response).to redirect_to(books_path)
    end
  end
end
