class UsersController < ApplicationController
  def index
    if params[:query].present?
      @pagy, @records = pagy(User.search_user(params[:query]), items: 10)
    else
      @pagy, @records = pagy(User.all, items: 10)
    end
  end
end
