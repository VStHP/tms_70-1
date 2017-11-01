require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create :user}
  subject {user}

  context "associations" do
    it {is_expected.to have_many :user_courses}
    it {is_expected.to have_many :user_subjects}
  end

  context "validates" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_length_of(:name).is_at_most(50)}
    it {is_expected.to validate_confirmation_of :password}
    it {is_expected.to validate_length_of(:password).is_at_least(6)}
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_length_of(:email).is_at_most(50)}
    it {is_expected.to validate_uniqueness_of(:email).case_insensitive}
  end

  context "column" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:email).of_type(:string)}
    it {is_expected.to have_db_column(:password_digest).of_type(:string)}
    it {is_expected.to have_db_column(:gender).of_type(:integer)}
    it {is_expected.to have_db_column(:date_start).of_type(:date)}
    it {is_expected.to have_db_column(:university).of_type(:string)}
    it {is_expected.to have_db_column(:organization).of_type(:string)}
    it {is_expected.to have_db_column(:program).of_type(:string)}
    it {is_expected.to have_db_column(:avatar).of_type(:string)}
    it {is_expected.to have_db_column(:suppervisor).of_type(:boolean)}
  end

  context "name is over 50 character" do
    before {subject.name = Faker::Lorem.characters(51)}
    it "matches the error message" do
      subject.valid?
      subject.errors[:name].should include("is too long (maximum is 50 characters)")
    end
    it {is_expected.to_not be_valid}
  end

  context "name is blank" do
    before {subject.name = ""}
    it "matches the errors message" do
      subject.valid?
      subject.errors[:name]. should include("can't be blank")
    end
    it {is_expected.to_not be_valid}
  end

  context "email is over 50 character" do
    before {subject.email = Faker::Lorem.characters(51)<<"@gmail.com"}
    it "matches the errors message" do
      subject.valid?
      subject.errors[:email].should include("is too long (maximum is 50 characters)")
    end
    it {is_expected.to_not be_valid}
  end

  context "email is blank" do
    before {subject.email = ""}
    it "matches the errors message" do
      subject.valid?
      subject.errors[:email].should include("can't be blank")
    end
    it {is_expected.to_not be_valid}
  end

  context "email is invalid" do
    before {subject.email = Faker::Lorem.characters(20)}
    it "matches the errors message" do
      subject.valid?
      subject.errors[:email].should include("is invalid")
    end
    it {is_expected.to_not be_valid}
  end

  context "password is below 6 characters" do
    before {subject.password = Faker::Lorem.characters(5)}
    it "matches the errors message" do
      subject.valid?
      subject.errors[:password].should include("is too short (minimum is 6 characters)")
    end
    it {is_expected.to_not be_valid}
  end

  context "sort_by_alphabet_name" do
    it "return list user sort by alphabe name" do
      User.alphabet_name == (user)
    end
  end

  context "list_without_suppervisor" do
    before {user.suppervisor = 0}
    it "return list user without suppervisor" do
      User.without_suppervisor == (user)
    end
  end

  context "list_with_suppervisor" do
    before {user.suppervisor = 1}
    it "return list user with suppervisor" do
      User.with_suppervisor == (user)
    end
  end
end
