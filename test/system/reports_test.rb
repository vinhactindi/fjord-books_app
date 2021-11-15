# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_path
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in '内容', with: 'Fancy content'
    fill_in 'タイトル', with: 'The amazing title'
    click_on '登録する'

    assert_text 'Fancy content'
    assert_text 'The amazing title'
    assert_text '日報が作成されました。'

    click_on '戻る'
    assert_selector 'h1', text: '日報'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in '内容', with: 'Updated fancy content'
    fill_in 'タイトル', with: 'The updated amazing title'
    click_on '更新する'

    assert_text 'Updated fancy content'
    assert_text 'The updated amazing title'
    assert_text '日報が更新されました。'

    click_on '戻る'
    assert_selector 'h1', text: '日報'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      find(:xpath, "//tr[td[contains(.,'#{reports(:one).title}')]]/td/a", text: '削除').click
    end

    assert_no_text reports(:one).title
    assert_text '日報が削除されました。'
  end
end
