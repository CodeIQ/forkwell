# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、「書いたもの」の一覧を閲覧できる' do
  let!(:publications) { 10.times.map { |i| Publication.create! title: "テスト #{i+1}", url: "http://example.com/test#{i+1}" } }

  scenario 'トップページから「書いたもの」の一覧ページに遷移することができる' do
    visit root_path
    click_link '一覧へ'

    publications.each do |pub|
      page.should have_content pub.title
    end
  end
end
