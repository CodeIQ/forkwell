# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、書いたものにスキルタグを登録できる' do
  let(:user) { User.create! username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'john@example.com' }
  let!(:publication) { Publication.create! title: 'テスト投稿', url: 'http://example.com' }

  context '非ログイン時' do
    scenario '登録フォームが表示されないこと' do
      visit root_path
      click_link '一覧へ'
      click_link publication.title

      page.should have_no_button 'スキルタグ登録する'
    end
  end

  context 'ログイン時' do
    background do
      any_instance_of(ApplicationController) do |controller|
        stub(controller).current_user { user }
      end
    end

    scenario '登録フォームが表示され、スキルタグを登録できること' do
      visit root_path
      click_link '一覧へ'
      click_link publication.title

      fill_in 'skilltag', with: 'ruby'
      click_button 'スキルタグ登録する'

      page.should have_content 'ruby'
    end
  end
end
