class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
    redirect_to book_path(book.id), notice: 'Thank you! Successfully created!'
    else
      redirect_to '/books'
      #render :books
    end
  end

  def index
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book.id), notice: 'Thank you! Successfully updated!'
    else
      render :books
    end
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
#.require(:book)いらない？