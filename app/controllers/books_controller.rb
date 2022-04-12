class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)#bookから@bookに変更
    if @book.save#bookから@bookに変更
    redirect_to book_path(@book.id), notice: 'Thank you,successfully created!'
   #↑bookから@bookに変更
    else
      @books = Book.all#インスタンス変数追加
      render :index #booksをindexに変更#indexのviewページへ
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
    redirect_to '/books', notice: 'successfully destroyed.'
  end

  def update
    @book = Book.find(params[:id])#title,body,errorの情報が含まれる
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'Thank you,successfully updated!'
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
#.require(:book)いらない？
#require(対象).permit(対象の名前、タイトルなど)