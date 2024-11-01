class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

    def index
        @books = Book.all.order('title ASC')
        render json: @books, status: :ok
    end

    def show
        @book = Book.find(params[:id])
        render json: @book, status: :ok
    end
    
    def create
        @book = Book.new(book_params)

        if @book.save
            render json: @book, status: :created
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          render json: @book, status: :ok
        else
          render json: @book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :published_date, :available_copies)
    end


end
