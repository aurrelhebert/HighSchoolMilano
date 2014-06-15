  class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    def index
      @titre = "Welcome"
      @description = ' Our school is one of the best known in the region and train hundreds of new students every years guiding them to the diploma.
      You can find here all the useful information about the school.'
    end



end
