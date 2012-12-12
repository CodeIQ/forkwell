# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、「書いたもの」の一覧を閲覧できる' do
  background do
    10.times.map.with_index(1) { |i| Publication.create! title: "テスト #{i+1}", url: "http://example.com/test#{i+1}" }
  end

  scenario 'トップページから「書いたもの」の一覧ページに遷移することができる' do
    visit root_path
    click_link '一覧へ'

    all('.publication').count.should == 10

    Publication.all.each do |pub|
      page.should have_content pub.title
    end
  end

  scenario 'トップページから「書いたもの」の一覧ページに遷移し、次のページに遷移することができる' do
    2.times.map.with_index(11) { |i| Publication.create! title: "テスト #{i+1}", url: "http://example.com/test#{i+1}"  }
    visit root_path
    click_link '一覧へ'

    all('.publication').count.should == 10

    click_link 'Next'

    all('.publication').count.should == 2
  end
end
