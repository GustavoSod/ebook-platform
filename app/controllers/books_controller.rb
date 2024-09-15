class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authorize_user!, only: %i[ edit update destroy ]

  def index
    if current_user.writer?
      @books = current_user.books 
    else
      @books = Book.all 
    end
  end

  # GET /books/1 or /books/1.json
  def show

  end

  def new
    if current_user.writer?
      @book = current_user.books.build # Apenas escritores podem criar livros
    else
      redirect_to books_path, alert: "Você não tem permissão para criar um livro."
    end
  end

  def edit

  end

  # POST /books or /books.json
  def create
    if current_user.writer?
      @book = current_user.books.build(book_params)
      if @book.save
        redirect_to @book, notice: "Livro criado com sucesso."
      else
        render :new
      end
    else
      redirect_to books_path, alert: "Você não tem permissão para criar um livro."
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Livro atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    redirect_to books_path, notice: "Livro excluído com sucesso."
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    def authorize_user!
      unless current_user.writer? && @book.user == current_user
        redirect_to books_path, alert: "Você não tem permissão para editar ou deletar este livro."
      end
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :user_id, :pdf, :image)
    end
end
