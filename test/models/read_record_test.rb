require "test_helper"

class ReadRecordTest < ActiveSupport::TestCase

  def setup
    @read_record = ReadRecord.new(body: "喜んでくれました!", read_date: 2024-05-19)
  end

  test "日付の必須" do
    @read_record.read_date = nil
    assert_not @read_record.valid?
  end
end
