# coding: utf-8
class PublicationsController < ApplicationController
  def index
    @publications = Publication.all
  end
end
