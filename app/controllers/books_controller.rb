class BooksController < ApplicationController
	def new
		 @book = Book.new
  end
  
	def create
	  @book = Book.new(book_params)
	 
	  if @book.save
	    redirect_to @book
	  else
	    render 'new'
	  end
	end

	def edit
 	 @book = Book.find(params[:id])
	end

	def update
	  @book = Book.find(params[:id])
	 
	  if @book.update(Book_params)
	    redirect_to @Book
	  else
	    render 'edit'
	  end
	end

	def index
		@books = Book.all
	end

	def show
	  @book = Book.find(params[:id])
	end

	def destroy
	  @book = Book.find(params[:id])
	  @book.destroy
	 
	  redirect_to books_path
	end
	 
	private
	  def book_params
	    params.require(:book).permit(:category_id, :book_name, :author_name, :price)
	  end

end
