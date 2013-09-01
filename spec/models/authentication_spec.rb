require 'spec_helper'

describe Authentication do
  subject { FactoryGirl.create(:authentication) }

  describe 'validations' do
    it { should be_valid }

    let(:invalid) { FactoryGirl.build(:authentication, user_id: nil, provider: nil, uid: nil) }
    it 'does not be valid without user, uid and provider' do 
      expect(invalid).to_not be_valid
      expect(invalid.errors.count).to eq(3)
    end

    let(:uniq) { FactoryGirl.build(:uniq_authentication, uid: subject.uid, provider: 'twitter') }
    it 'does be valid with different provider' do 
      expect(uniq).to be_valid
    end

    let(:non_uniq) { FactoryGirl.build(:uniq_authentication, uid: subject.uid) }
    it 'does not be valid because uid uniqueness' do
      expect(non_uniq).to_not be_valid
      expect(non_uniq.errors.messages[:uid]).to eq(["has already been taken"])
    end
  end
end
