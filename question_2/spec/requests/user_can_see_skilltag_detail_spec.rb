# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、スキルタグの詳細情報を閲覧できる' do
  let(:ruby) { Skilltag.create! name: 'ruby' }
  let(:users) { 10.times.map.with_index(1) { |i| User.create! username: "johndoe_#{i}", first_name: "John#{i}", last_name: "Doe#{i}", email: "john_#{i}@example.com" } }
  let(:publications) { 10.times.map.with_index(1) { |i| Publication.create! title: "テスト投稿 その#{i}", url: "http://example.com/test_#{i}" } }

  background do
    users[0..2].map {|u| u.skilltags << ruby }
    publications[0..2].map {|pub| pub.skilltags << ruby }
  end

  scenario 'スキルタグの詳細ページで、スキルタグに関連する書いたものの一覧を閲覧できること' do
    visit skilltag_path(name: ruby.name)

    ruby.publications.each do |pub|
      page.should have_content pub.title
    end
    page.should have_no_link '書いたもの'
  end

  scenario 'スキルタグの詳細ページで、スキルタグを自分に登録しているユーザーの一覧を閲覧できること' do
    visit skilltag_path(name: ruby.name)
    click_link 'ユーザー'

    ruby.users.each do |user|
      page.should have_content user.first_name
      page.should have_content user.last_name
    end
    page.should have_no_link 'ユーザー'
  end
end
