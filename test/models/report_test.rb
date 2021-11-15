# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    bob = users(:bob)

    report = alice.reports.create!(title: 'Fancy title', content: 'This is a nice content')

    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = users(:alice).reports.create!(title: 'Fancy title', content: 'This is a nice content', created_at: '2021/11/05'.in_time_zone)

    assert_equal Date.new(2021, 11, 5), report.created_on
  end
end
