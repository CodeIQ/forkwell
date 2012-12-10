# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして自分にスキルタグを追加できる' do
  let!(:user) { User.create! username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'john@example.com' }

  context '非ログイン時' do
    scenario '自分のページでスキルタグの追加フォームが表示されないこと' do
      visit user_path user
      page.should have_no_button '登録する'
    end
  end

  context 'ログイン時' do
    background do
      any_instance_of(ApplicationController) do |controller|
        stub(controller).current_user { user }
      end
    end

    context 'すでに登録済みのスキルタグの場合' do
      background do
        user.skilltags << Skilltag.create!(name: 'ruby')
      end

      scenario '登録しようとするとエラーメッセージとともにリダイレクトされること' do
        visit user_path user
        fill_in 'skilltag_name', with: 'ruby'
        click_button '登録する'

        current_path.should eq user_path(user)
        page.should have_content 'ruby'
        page.should have_content 'すでに登録済みです'
      end
    end

    context 'まだ登録していないスキルタグの場合' do
      scenario '自分のページでスキルタグの追加フォームにスキルタグを入力し、追加できること' do
        visit user_path user
        fill_in 'skilltag_name', with: 'ruby'
        click_button '登録する'

        current_path.should eq user_path(user)
        page.should have_content 'ruby'
      end
    end
  end
end
