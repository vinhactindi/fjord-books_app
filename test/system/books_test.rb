# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: 'Fancy book memo'
    fill_in 'タイトル', with: 'The amazing title'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Fancy book memo'
    assert_text 'The amazing title'

    click_on '戻る'
    assert_selector 'h1', text: '本'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'メモ', with: 'An updated memo'
    fill_in 'タイトル', with: 'The updated amazing title'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'An updated memo'
    assert_text 'The updated amazing title'

    click_on '戻る'
    assert_selector 'h1', text: '本'
  end

  test 'destroying a Book' do
    visit books_url

    tr = all('tr').find { |element| element.text.include?('Sapiens - A Brief History Of Humankind') }

    within tr do
      click_link '削除'
    end

    accept_alert

    assert_no_text 'Sapiens - A Brief History Of Humankind'
    assert_text '本が削除されました。'
  end
end
