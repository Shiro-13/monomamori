class SearchsController < ApplicationController

  def search
  #   # viewのform_tagにて
  #   # 検索ワードを@contentに代入。
  #   @word = params[:word]
    @items = Item.search(params[:search])
    @search = params[:search]
  end

  # private
  # def search_for(model, content, method)
  #   # 選択したモデルがuserだったら
  #   if model == 'user'
  #     # 選択した検索方法がが完全一致だったら
  #     if method == 'perfect'
  #       User.where(name: content)
  #     # 選択した検索方法がが部分一致だったら
  #     else
  #       User.where('name LIKE ?', '%'+content+'%')
  #     end
  #   # 選択したモデルがpostだったら
  #   elsif model == 'post'
  #     if method == 'perfect'
  #       Post.where(title: content)
  #     else
  #       Post.where('title LIKE ?', '%'+content+'%')
  #     end
  #   end
  # end

end
