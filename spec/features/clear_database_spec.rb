require 'spec_helper'

feature 'Clean database' do
  scenario 'remove all users' do
    User.create
    expect {
      visit '/database_cleaner/clean'
    }.to change { User.count }.from(1).to(0)
  end
end
