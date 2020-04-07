require 'user.rb'
describe User do

  describe "#create" do

    before(:each) do
      @user = User.create(name: 'testing', dob: '04/04/20', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')
    end

    it 'Can create a new user' do
      expect(@user.email).to eq 'test@test.com'
      expect(@user.name).to eq 'testing'
      expect(@user.dob).to eq '04/04/20'
      expect(@user.cob).to eq 'england'
    end

    it 'cannot register if the email address already exists in the database' do
      expect{User.create(name: 'testing', dob: '04/04/20', cob: 'england', mob: 999, email: 'test@test.com', password: 'password')}.to raise_error "E-mail address already exists"  
    end
  end
end