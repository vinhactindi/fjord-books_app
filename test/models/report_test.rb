# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user = User.create!(email: 'foo@example.com', password: 'password')
    report = Report.create!(user_id: user.id, title: 'Fancy title', content: 'This is a nice content')

    assert report.editable?(user)
  end

  test '#created_on' do
    user = User.create!(email: 'foo@example.com', password: 'password')
    report = Report.create!(user_id: user.id, title: 'Fancy title', content: 'This is a nice content', created_at: '2021/11/05')

    assert_equal Date.new(2021, 11, 5), report.created_on
  end
end
