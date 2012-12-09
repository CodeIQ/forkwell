# coding: utf-8
class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end
end
