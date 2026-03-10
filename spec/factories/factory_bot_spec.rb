require 'rails_helper'

RSpec.describe "FactoryBot" do
  it "has valid factories" do
    # FactoryBot.lint(traits: true)
    FactoryBot.lint(strategy: :build)
  end
end
