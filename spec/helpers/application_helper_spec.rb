require 'spec_helper'

describe ApplicationHelper do
  describe 'title' do
    subject { page_title('foo') }

    it 'does include page title' do
      should match(/foo/)
    end

    it 'does include base title' do
      should match(/Barcelona on Rails$/)
    end

    it 'does not include dash with blank page title' do
      expect(page_title('')).to_not match(/-/)
    end
  end
end
