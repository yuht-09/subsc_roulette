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
    let(:user_1) { create :user, name: 'user_1', email: 'aaa@bbb' }
    let(:user_2) { create :user, name: 'user_2', email: 'bbb@ccc' }
    let(:movie_1) { build :movie, name: 'original_name_33' }
    let(:movie_2) { build :movie, name: 'original_name_34' }
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
      let(:login_user) { user_2 }
      before do
        allow(TmdbApi).to receive(:like).and_return([movie_2])
        visit user_path(user_2)
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
  describe '#like_movie' do
    let(:user_1) { create :user, name: 'user_1', email: 'aaa@bbb' }
    let(:user_2) { create :user, name: 'user_2', email: 'bbb@ccc' }
    let(:movie_1) { build :movie, name: 'original_name_33' }
    let(:movie_2) { build :movie, name: 'original_name_34' }
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
      it 'original_name_33が表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('original_name_33')
        click_link('詳細')
        expect(page).to have_content('original_name_33')
        expect(page).to have_content('気になる')
      end
      it 'original_name_34が表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('original_name_34')
        click_link('詳細')
        expect(page).to have_no_content('original_name_34')
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
      it 'original_name_34が表示される' do
        click_link('気になるリスト')
        expect(page).to have_content('original_name_34')
        click_link('詳細')
        expect(page).to have_content('original_name_34')
        expect(page).to have_content('気になる')
      end
      it 'original_name_33が表示されない' do
        click_link('気になるリスト')
        expect(page).to have_no_content('original_name_33')
        click_link('詳細')
        expect(page).to have_no_content('original_name_33')
        expect(page).to have_content('気になる')
      end
    end
  end
end
