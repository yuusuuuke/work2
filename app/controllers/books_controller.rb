class BooksController < ApplicationController

 def index
   @book = Book.new 
   @books = Book.all #newで、Bookテーブルのからのレコード呼び出す
 end
 
 def show
   @book = Book.find(params[:id])
 end

 def edit
    @book = Book.find(params[:id])
 end
 
 def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "Book was successfully updated."
     redirect_to book_path(@book.id)
   else
     render:edit
   end
 end
 
 def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"  #urlで書く場合は"/    "で
 end
 
 def create
  @book = Book.new(book_params)
  if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)#showに飛びたい
  else
   @books = Book.all
   render:index
  end
 end
 
 
 
   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
