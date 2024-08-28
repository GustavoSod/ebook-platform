require 'rails_helper'

RSpec.describe User, type: :model do
  it 'create a new user' do
    user = create(:user)
  end

  it 'creates a new user without password' do
    expect {
      create(:user, email: 'teste@gmail.com', password: nil)
    }.to raise_error(ActiveRecord::RecordInvalid, /Password can't be blank/)
  end

  it 'creates a new user without email' do
    expect {
      create(:user, email: nil, password: '123')
    }.to raise_error(ActiveRecord::RecordInvalid, /Email can't be blank/)
  end

  it 'does not allow duplicate email addresses' do
    create(:user, email: 'unique_email@example.com')
    expect {
      create(:user, email: 'unique_email@example.com')
    }.to raise_error(ActiveRecord::RecordInvalid, /Email has already been taken/)
  end

  it 'does not allow invalid email formats' do
    expect {
      create(:user, email: 'invalid_email', password: '123456')
    }.to raise_error(ActiveRecord::RecordInvalid, /Email is invalid/)
  end
  
  it 'requires a minimum password length' do
    expect {
      create(:user, email: 'test@example.com', password: '123')
    }.to raise_error(ActiveRecord::RecordInvalid, /Password is too short/)
  end

  it 'does not allow invalid email formats' do
    expect {
      create(:user, email: 'invalid_email', password: '123456')
    }.to raise_error(ActiveRecord::RecordInvalid, /Email is invalid/)
  end  

  it 'requires password confirmation to match password' do
    user = build(:user, password_confirmation: 'mismatch')
    expect(user).not_to be_valid
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
  
  it 'creates a new user with valid attributes' do
    user = create(:user, email: 'valid@example.com', password: 'validpassword')
    expect(user).to be_persisted
    expect(user.email).to eq('valid@example.com')
  end
  
end
