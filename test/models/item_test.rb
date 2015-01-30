require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "should validate presence of target_id" do
    item = Item.new
    refute item.valid?
    assert item.errors[:target_id].include?("can't be blank")
  end

  test "should belong_to a target" do
    target = Target.create!(:url => "www.target.com")
    item = Item.new(:target_id => target.id)
    assert_equal target, item.target
  end
end
