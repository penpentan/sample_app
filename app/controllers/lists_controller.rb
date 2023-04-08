class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list =List.new
  end

  def create
    @list = List.new(list_params) #データを受け取るための新規のインスタンス作成
    if @list.save #saveメソッド実行
      flash[:notice] = "投稿が成功しました"
      redirect_to list_path(@list.id) #リダイレクト
    else
      render :new #新規投稿ページを再表示
    end
  end

  def index
    @lists = List.all #litsテーブルに保存されているすべてのデータを取得
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list =List.find(params[:id])
    list.destroy
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end

  private
  #ストロングパラメータ（送られた正しいものしか保存できないようにしている?）
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
