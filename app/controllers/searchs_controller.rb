class SearchsController < ApplicationController

  def search
  #   # 検索ワードを@searchに代入。
    @items = Item.search(params[:search])
    @search = params[:search]
  end

end
