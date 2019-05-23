class BooksController < ApplicationController
	def new
		 @book = Book.new
  end
  
	def create
	  @book = Book.new(book_params)
	 
	  if @book.save
	  	flash[:success] = "You are successfully saved."
	  	#byebug
	  	UserMailer.welcome_email(current_user).deliver_now
	    redirect_to @book
	  else
	  	flash.now[:error] = "You have not updated #{@book.name}."
	    render 'new'
	  end
	end

	def edit
		# byebug
     # byebug
 	 @book = Book.find(params[:id])
	end

	def update
	  @book = Book.find(params[:id])
	 
	  if @book.update(book_params)
	  	flash[:success] = "You are successfully updated."
	    redirect_to @book
	  else
	    render 'edit'
	  end
	end

	def index
		# @books = Book.all
		 if params[:search]
    	@books = Book.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 10)
  	else
    	@books = Book.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
  	end

  	# @books=Book.paginate(page: params[:page], per_page: 3)
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
	    params.require(:book).permit(:category_id, :book_name, :author_name, :price, :image, :user_id)
	  end

end
