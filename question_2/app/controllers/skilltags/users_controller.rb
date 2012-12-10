# coding: utf-8
class Skilltags::UsersController < ApplicationController
  def index
    @skilltag = Skilltag.find_by_name params[:name]
    raise ActiveRecord::RecordNotFound if @skilltag.nil?

    @users = @skilltag.users.all
  end
end
