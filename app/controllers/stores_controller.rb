class StoresController < ApplicationController
  def index
    @stores = Store.search(params[:keyword])
  end

  def faq
  end
end
