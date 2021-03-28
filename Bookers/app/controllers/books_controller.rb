class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def new
    @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  	@book_new = Book.new
  end

  def create
    #@books = Book.all
    #@book = Book.new(book_params)
      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
      else
        @books=Book.all
        flash[:notice] = "errors prohibited this obj from being saved:"
        render :index
      end
  end

  def edit
  	@book = Book.find(params[:id])
  end

    def update
        @books = Book.all
        @book = Book.find(params[:id])
        if @book.update(book_params)
        flash[:notice] = "successfully."
        redirect_to  book_path(@book.id)
        else
        @books = Book.all
         flash[:notice]= "errors prohibited this obj from being saved:"
        render :index

        end
    end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "successfully"
  	redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
