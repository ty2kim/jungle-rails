require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'is not valid without password and password_confirmation' do
      user = User.create(first_name: 'Amy', last_name: 'A', email: 'amy@example.com')
      puts "Error: #{user.errors.full_messages}"
      # user.valid?.should be_true
      expect(user).not_to be_valid
    end
    it 'is not valid if password and password_confirmation do not match' do
      user = User.create(first_name: 'Amy', last_name: 'A', email: 'amy@example.com', password: '1', password_confirmation: '2')
      puts "Error: #{user.errors.full_messages}"
      # user.valid?.should be_true
      expect(user).not_to be_valid
    end
    it 'is not valid if email is not unique' do
      User.create(first_name: 'Amy', last_name: 'A', email: 'amy@example.com', password: '1', password_confirmation: '1')
      user = User.create(first_name: 'Chris', last_name: 'C', email: 'AMY@example.com', password: '1', password_confirmation: '1')
      puts "Error: #{user.errors.full_messages}"
      # user.valid?.should be_true
      expect(user).not_to be_valid
    end
    it 'is not valid without first_name and last_name' do
      user = User.create(email: 'amy@example.com', password: '1', password_confirmation: '1')
      puts "Error: #{user.errors.full_messages}"
      # user.valid?.should be_true
      expect(user).not_to be_valid
    end
    it 'is not valid if password exceeds minimum length' do
      long_password = 'WEeoFOkfjbTDIgDjDYgCqg6GhcOUAKIZ97wg1PRBcWDz3cIbwPma92byIHkP2XcBUTFViqzXr'
      user = User.create(first_name: 'Amy', last_name: 'A', email: 'amy@example.com', password: long_password, password_confirmation: long_password)
      puts "Error: #{user.errors.full_messages}"
      # user.valid?.should be_true
      expect(user).not_to be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it 'is not nil even if visitors have spaces before and/or after their emails' do
      User.create(first_name: 'Amy', last_name: 'A', email: 'amy@example.com', password: '1', password_confirmation: '1')
      user = User.authenticate_with_credentials('  amy@example.com  ', '1')
      expect(user).not_to be_nil
    end
    it 'is not nil even if visitors type wrong cases for their emails' do
      User.create(first_name: 'Amy', last_name: 'A', email: 'amY@examplE.coM', password: '1', password_confirmation: '1')
      user = User.authenticate_with_credentials('Amy@Example.Com', '1')
      expect(user).not_to be_nil
    end
  end
end

# create_table "users", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.string   "email"
#   t.string   "password_digest"
#   t.datetime "created_at",      null: false
#   t.datetime "updated_at",      null: false
# end
