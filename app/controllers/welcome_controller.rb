class WelcomeController < ApplicationController
  def index
    @items = Item.where public: true
  end
end
