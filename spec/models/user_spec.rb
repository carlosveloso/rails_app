require 'spec_helper'

describe User do
  before do
	   @user = User.new name: "Test User", email: "test@email.com",
	   			password: "foobar", password_confirmation: "foobar"
	end

  subject { @user }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :remember_token }
  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
  
  describe "When name is not present" do
  	before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "When email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "When name is too long" do
    before {@user.name = "a" * 51}
    it { should_not be_valid }
  end

  describe "When email is valid" do
  	it "Should be valid" do
  		valid_emails = %w[test@test.com TEST@TEST.COM test.t@t.com]
	  	valid_emails.each do |email|
	  		@user.email = email
	  		@user.should be_valid
	  	end
  	end
  end

  describe "When email is invalid" do
  	it "Should not be valid" do
  		invalid_emails = %w[test_at_test.com TEST@TEST. test.t@t,com test@+test.com test@test+test.com test@test_test.com]
	  	invalid_emails.each do |email|
	  		@user.email = email
	  		@user.should_not be_valid
	  	end
  	end
  end

  describe "When email already taken" do
    before do
      same_email_user = @user.dup
      same_email_user.email = @user.email.upcase
      same_email_user.save
    end

    it { should_not be_valid }
  end

  describe "When password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "When password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

    # describe "When password confirmation is nil" do
    #   before { @user.password_confirmation = nil }
    #   it { should_not be_valid }
    # end

  describe "When password is too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end

  describe "Return value of auth method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }
    
    describe "when password is valid" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "when password is invalid" do
      let(:user_with_invalid_password) { found_user.authenticate('invalid') }
      it { should_not == user_with_invalid_password }

      specify { expect(user_with_invalid_password).to be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

end
