require 'rails_helper'

RSpec.describe Category, type: :model do

  it "throws error when submitting empty category name" do
    @category = Category.new(name: "")
    @category.save
    expect(@category).not_to be_valid
  end
end
