# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、自分を書いたものの著者として登録できる' do
  let(:user) { User.create! username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'john@example.com' }
  let!(:publication) { Publication.create! title: 'テスト投稿', url: 'http://example.com' }

  context '非ログイン時' do
    scenario '書いたものの詳細画面で、著者登録用のリンクが表示されないこと' do
      visit root_path
      click_link '一覧へ'

      click_link publication.title

      page.should have_no_link '自分を著者に登録'
    end
  end

  context 'ログイン時' do
    background do
      any_instance_of(ApplicationController) do |controller|
        stub(controller).current_user { user }
      end
    end

    context '登録していない場合' do
      scenario '書いたものの詳細画面で、著者登録用のリンクが表示され、自分を著者に登録できること' do
        visit root_path
        click_link '一覧へ'

        click_link publication.title

        click_link '自分を著者に登録'

        page.should have_content user.username
      end
    end

    context '登録済みの場合' do
      background do
        publication.users << user
      end

      scenario '書いたものの詳細画面で、著者登録用のリンクが表示されないこと' do
        visit root_path
        click_link '一覧へ'

        click_link publication.title

        page.should have_no_link '自分を著者に登録'
      end
    end
  end
end
