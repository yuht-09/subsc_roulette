require 'rails_helper'

RSpec.describe "Movies", type: :system do
  describe '#show' do
    before do
      movies = FactoryBot.build_list(:movie, 10)
      allow(TmdbApi).to receive(:all).and_return(movies)
    end

    context 'ユーザーがログインしている時' do
      let(:user) { create :user }
      before do
        visit login_path
        fill_in 'email', with: user.email
        fill_in 'password', with: '000000'
        click_button('ログイン')
      end

      it '気になるボタンが表示される' do
        visit root_path
        click_link('Netflix')
        click_link('テンション上げたい')
        expect(page).to have_content('気になる')
      end
    end

    context 'ユーザーがログインしていない時' do
      it '気になるボタンは表示されない' do
        visit root_path
        click_link('Netflix')
        click_link('テンション上げたい')
        expect(page).to have_no_content('気になる')
      end
    end

    context 'ランダムでmovieが表示される' do
      it 'ランダム' do
        visit root_path
        click_link('Netflix')
        click_link('テンション上げたい')
        expect(page).to have_content('動画が表示されました')
      end
    end
  end

  describe '#likes' do
    let(:user_a) { create :user, name: 'user_1', email: 'aaa@bbb' }
    let(:user_b) { create :user, name: 'user_2', email: 'bbb@ccc' }
    let(:movie_1) { build :movie, original_name: 'original_name_33' }
    let(:movie_2) { build :movie, original_name: 'original_name_34' }
    before do
      visit login_path
      fill_in 'email', with: login_user.email
      fill_in 'password', with: '000000'
      click_button('ログイン')
    end

    context 'user_aがログインしている時' do
      let(:login_user) { user_a }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_1])
        visit user_path(user_a)
      end
      it 'original_name_33が表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('original_name_33')
      end
      it 'original_name_34が表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('original_name_34')
      end
    end
    
    context 'user_bがログインしている時' do
      let(:login_user) { user_b }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_2])
        visit user_path(user_b)
      end
      it 'original_name_34が表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('original_name_34')
      end
      it 'original_name_33が表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('original_name_33')
      end
    end
  end
end
