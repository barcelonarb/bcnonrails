require 'spec_helper'

describe "Pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_title(page_title('')) }
    it { should_not have_title('-')}
  end
end
