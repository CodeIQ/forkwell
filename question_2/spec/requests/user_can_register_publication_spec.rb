# coding: utf-8
require 'spec_helper'

feature 'ユーザーとして、書いたものを登録できる' do
  let(:user) { User.create! username: 'johndoe', first_name: 'John', last_name: 'Doe', email: 'john@example.com' }

  background do
    any_instance_of(ApplicationController) do |controller|
      stub(controller).current_user { user }
    end
  end

  scenario '書いたもののタイトルとURLを入力して、登録できる' do
    title  = 'タイトル'
    scheme = 'http://'
    url    = 'example.com'

    visit new_publication_path

    fill_in 'Title', with: title
    fill_in 'Url', with: "#{scheme}#{url}"

    click_button 'Save'

    current_path.should eq publication_path(Publication.last)

    page.should have_content title
    page.should have_link url
    page.should_not have_content scheme
  end
end
