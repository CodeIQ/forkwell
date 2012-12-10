# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、スキルタグの詳細情報を閲覧できる' do
  let(:ruby) { Skilltag.create! name: 'ruby' }
  let(:publications) { 10.times.map.with_index(1) { |i| Publication.create! title: "テスト投稿 その#{i}", url: "http://example.com/test_#{i}" } }

  background do
    publications[0..2].map {|pub| pub.skilltags << ruby }
  end

  scenario 'スキルタグの詳細ページで、スキルタグに関連する書いたものの一覧を閲覧できること' do
    visit skilltag_path(name: ruby.name)

    ruby.publications.each do |pub|
      page.should have_content pub.title
    end
  end
end
