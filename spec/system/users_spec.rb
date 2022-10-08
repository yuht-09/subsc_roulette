require 'rails_helper'

RSpec.describe "Users", type: :system do
  describe User do
    describe '新規登録' do
      it "新規登録に失敗" do
        visit new_user_path
        click_button('登録')
        expect(page).to have_content('ユーザー登録に失敗しました')
      end
      it 'ユーザー登録に成功' do
        visit new_user_path
        fill_in 'user[name]', with: 'user_1'
        fill_in 'user[email]', with: '1@example.com'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
        click_button('登録')
        expect(page).to have_content('ユーザー登録が完了しました')
      end
    end
  end
end
