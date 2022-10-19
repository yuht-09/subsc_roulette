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
    let(:user_1) { create :user, name: 'user_1', email: '1@gmail.com' }
    let(:user_2) { create :user, name: 'user_2', email: '2@gmail.com' }
    let(:movie_1) { build :movie, name: 'ワンピース', poster_path: 'goKUd5y4lHU3qkW0XKKxmNSNcem.jpg' }
    let(:movie_2) { build :movie, name: 'ストレンジャーシングス', poster_path: 'kyXBjSIfePi1AKvwjkn0wuCAPTq.jpg' }
    before do
      visit login_path
      fill_in 'email', with: login_user.email
      fill_in 'password', with: '000000'
      click_button('ログイン')
    end

    context 'user_aがログインしている時' do
      let(:login_user) { user_1 }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_1])
        visit user_path(user_1)
      end
      it 'ワンピースが表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('ワンピース')
      end
      it 'ストレンジャーシングスが表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('ストレンジャーシングス')
      end
    end
    
    context 'user_bがログインしている時' do
      let(:login_user) { user_2 }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_2])
        visit user_path(user_2)
      end
      it 'ストレンジャーシングスが表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('ストレンジャーシングス')
      end
      it 'ワンピースが表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('ワンピース')
      end
    end
  end
  describe '#like_movie' do
    let(:user_1) { create :user, name: 'user_1', email: '1@gmail.com' }
    let(:user_2) { create :user, name: 'user_2', email: '2@gmail.com' }
    let(:movie_1) { build :movie, name: 'ワンピース', poster_path: 'goKUd5y4lHU3qkW0XKKxmNSNcem.jpg' }
    let(:movie_2) { build :movie, name: 'ストレンジャーシングス', poster_path: 'kyXBjSIfePi1AKvwjkn0wuCAPTq.jpg' }
    before do
      visit login_path
      fill_in 'email', with: login_user.email
      fill_in 'password', with: '000000'
      click_button('ログイン')
    end

    context 'user_aがログインしている時' do
      let(:login_user) { user_1 }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_1])
        allow(TmdbApi).to receive(:like_movies).and_return([movie_1])
        visit user_path(user_1)
      end
      it 'ワンピースが表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('ワンピース')
        click_link('詳細')
        expect(page).to have_content('ワンピース')
        expect(page).to have_content('気になる')
      end
      it 'ストレンジャーシングスが表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('ストレンジャーシングス')
        click_link('詳細')
        expect(page).to have_no_content('ストレンジャーシングス')
        expect(page).to have_content('気になる')
      end
    end
    
    context 'user_bがログインしている時' do
      let(:login_user) { user_2 }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_2])
        allow(TmdbApi).to receive(:like_movies).and_return([movie_2])
        visit user_path(user_2)
      end
      it 'ストレンジャーシングスが表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('ストレンジャーシングス')
        click_link('詳細')
        expect(page).to have_content('ストレンジャーシングス')
        expect(page).to have_content('気になる')
      end
      it 'ワンピースが表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('ワンピース')
        click_link('詳細')
        expect(page).to have_no_content('ワンピース')
        expect(page).to have_content('気になる')
      end
    end
  end
end
