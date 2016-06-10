require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'sudoers class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'sudoers': }

      sudoers::sudo { 'rekcuf':
        withoutpassword => true,
      }

      sudoers::sudo { 'ualoc':
        withoutpassword => true,
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package($packagename) do
      it { is_expected.to be_installed }
    end

    describe file('/etc/sudoers') do
      it { should be_file }
      its(:content) { should match 'puppet managed file' }
      its(:content) { should match 'Defaults  !requiretty' }
      its(:content) { should match 'Defaults  !visiblepw' }
    end

    describe file('/etc/sudoers.d/10_10_sudo_rekcuf') do
      it { should be_file }
      its(:content) { should match 'rekcuf ALL=(ALL) NOPASSWD: ALL' }
    end

    describe file('/etc/sudoers.d/10_10_sudo_ualoc') do
      it { should be_file }
      its(:content) { should match 'ualoc ALL=(ALL) ALL' }
    end

  end

end
