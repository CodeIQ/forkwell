# coding: utf-8
class SkilltagsController < ApplicationController
  # POST /users/:user_id/skilltags
  def create
    @user = User.find params[:user_id]
    @skilltag = Skilltag.where(name: params[:skilltag][:name]).first_or_initialize

    if @user.skilltags << @skilltag
      redirect_to @user, notice: "#{@skilltag.name}を登録しました"
    else
      redirect_to @user, notice: "#{@skilltag.name}を登録できませんでした"
    end
  end
end
