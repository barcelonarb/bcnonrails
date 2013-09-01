require 'spec_helper'

describe User do
  subject(:user) { FactoryGirl.create(:user) }
  subject(:with_github) { FactoryGirl.create(:with_oauth, authentications: [FactoryGirl.create(:github)]) }

  describe 'validations' do
    context 'without authentications' do
      it { expect(user).to be_valid }

      let(:no_email) { FactoryGirl.build(:user, email: nil) }
      it { expect(no_email).to_not be_valid }
    end

    context 'with authentications' do
      it { expect(with_github).to be_valid }
    end
  end

  describe 'associations' do
    context 'authentications' do
      it { expect(with_github.authentications.first).to be_a(Authentication) }
    end
  end

  describe '.password_required?' do
    context 'without authentications' do
      it { expect(user.password_required?).to be_true }
    end

    context 'with authentications' do
      it { expect(with_github.password_required?).to be_false }
    end
  end
end
