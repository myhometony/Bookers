class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)#bookから@booknに変更
    if @book.save#bookから@booknに変更
    redirect_to book_path(@book.id), notice: 'Thank you! Successfully created!'
   #↑bookから@booknに変更
    else
      @books = Book.all#インスタンス変数追加
      render :index #booksをindexに変更
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    #インスタンス変数@bookを追加

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
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'Thank you! Successfully updated!'
    else
      @book = Book.find(params[:id])
      render :edit
    end
  end

  private
  def book_params
    params.permit(:title, :body)
  end
end
#.require(:book)いらない？