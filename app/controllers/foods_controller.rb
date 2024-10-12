class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]
  def index
    @foods = Food.includes(:user, :likes).order(created_at: :asc)
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.create!(food_params)
    # food = Food.new(food_params)
    # food.user_id = current_user.id
    # food.save!
    redirect_to food
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
  end

  def update
    @food.update!(food_params)
    redirect_to @food
  end

  def destroy
    @food.destroy!
    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :comment, :avatar)
  end

  def set_food
    # 「自分の投稿」の中から URL の :id に対応する投稿を探す
    # 「他人の投稿」の場合はエラーを出す.find メソッドを使用すると，他人の投稿の場合にエラーが発生します。
    @food = current_user.foods.find(params[:id])
  end
end
