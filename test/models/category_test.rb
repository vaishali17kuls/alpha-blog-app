require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
 def setup #this will run b4 every test
   @category = Category.new(name: "sports")  #this will be in test database
 end

test "category should be valid" do   #make test
assert @category.valid?
end

test "name should be present" do
@category.name = " "
assert_not @category.valid?
end

test "name should be unique" do
@category.save
category2 = Category.new(name: "sports")
assert_not category2.valid?
end

test "name should not be too long" do
@category.name = "a" * 26  #bcs v wnt 25 characters
assert_not @category.valid?
end

test "name should not be too short" do
@category.name = "aa" #bcs v wnt min 3 characters
assert_not @category.valid?
end

end