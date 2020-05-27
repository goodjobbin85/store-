require 'rails_helper'

RSpec.describe Category, type: :model do

  it "throws error when submitting empty category name" do
    @category = Category.new(name: "")
    @category.save
    expect(@category).not_to be_valid
  end

  it "accepts a string value" do
    @category = Category.new(name: "sporting goods")
    @category.save
    expect(@category).to be_valid
  end

  it "does not accept duplicate categories" do
    @category = Category.new(name: "jewelry")
    @category.save
    @category2 = Category.new(name: "jewelry")
    @category2.save
    expect(@category2).not_to be_valid
  end
end
