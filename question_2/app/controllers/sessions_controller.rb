# coding: utf-8
class SessionsController < ApplicationController
  def login
    session[:current_user] = 1
    redirect_to root_path
  end

  def logout
    session[:current_user] = nil
    current_user = nil

    redirect_to root_path
  end
end
