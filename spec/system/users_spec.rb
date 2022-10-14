require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe '新規登録' do
    it '新規登録に失敗' do
      visit new_user_path
      click_button('登録')
      expect(page).to have_content('ユーザー登録に失敗しました')
    end
    it '新規登録に成功' do
      visit new_user_path
      fill_in 'user[name]', with: 'abc'
      fill_in 'user[email]', with: 'aaa@bbb'
      fill_in 'user[password]', with: '000000'
      fill_in 'user[password_confirmation]', with: '000000'
      click_button('登録')
      expect(page).to have_content('ユーザー登録が完了しました')
    end
  end

  describe 'ログイン' do
    let(:user) { create :user }
    it 'ログインに失敗' do
      visit login_path
      click_button('ログイン')
      expect(page).to have_content('ログインに失敗しました')
    end
    it 'ログインに成功' do
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: '000000'
      click_button('ログイン')
      expect(page).to have_content('ログインしました')
    end
  end

  describe 'ユーザー編集' do
    let(:user) { create :user }
    before do
      visit login_path
      fill_in 'email', with: user.email
      fill_in 'password', with: '000000'
      click_button('ログイン')
      visit user_path(user)
    end
    context 'ログインユーザー' do
      it 'ユーザー編集に失敗' do
        click_link('プロフィール編集')
        fill_in 'user[name]', with: ""
        fill_in 'user[email]', with: ""
        click_button('登録')
        expect(page).to have_content('ユーザーの編集に失敗しました')
      end
      it 'ユーザー編集に成功' do 
        click_link('プロフィール編集')
        fill_in 'user[name]', with: "edit"
        fill_in 'user[email]', with: "edit@bbb"
        click_button('登録')
        expect(page).to have_content('ユーザーを編集しました')
      end
    end
  end
end