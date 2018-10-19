require 'test_helper'

class PoolTest < ActiveSupport::TestCase

  test "should not save pool without volume" do
    pool = Pool.new
    assert_not pool.save
  end

end
