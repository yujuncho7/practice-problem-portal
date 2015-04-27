require 'spec_helper'

describe Student do

  before do
    @user_attr = FactoryGirl.attributes_for(:student)
    @user = FactoryGirl.create(:student)
#Student.create!(@user_attr)
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it {should_not be_is_instructor }


  describe "when password is not present" do
      before { @user.password = @user.password_confirmation = " " }
      it { should_not be_valid }
  end
  describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
  end

end
