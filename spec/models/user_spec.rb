require 'rails_helper'

RSpec.describe User, type: :model do

  # it "is valid with a name,email, and password" do
  #   user = User.new(
  #     name: nil,
  #     email: 'hoge@email.com',
  #     password: "1234qwer",
  #   )
  #   # expect(user).to be_vaild
  #   expect(user.errors[:name]).to_not include("can't be blank")
  # end

  it"is invalid with out a first name"do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to_not include("can't be blank")
  end
  # Assosiaction test
  # ensure User Model has a 1:m relationship with the Todo model
  it { should have_many(:todos) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
