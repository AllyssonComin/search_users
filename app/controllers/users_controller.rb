class UsersController < ApplicationController
  def index
    # @users = User.all
    @pagy, @records = pagy(User.all, items: 10)
  end
end
