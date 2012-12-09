# coding: utf-8
class PublicationsController < ApplicationController
  def index
    @publications = Publication.order('created_at desc')
  end

  def show
    @publication = Publication.find params[:id]
  end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new params[:publication]
    @publication.users << current_user

    if @publication.save
      redirect_to @publication, notice: "#{@publication.title}を登録しました"
    else
      render 'new'
    end
  end
end
