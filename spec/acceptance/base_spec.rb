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
        withoutpassword => false,
      }

      sudoers::sudo { 'varis':
        username        => [ 'userA', 'userB' ],
        withoutpassword => false,
      }

      sudoers::defaults { 'requiretty':
        username => 'nrpe',
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
      its(:content) { should include('rekcuf ALL=(ALL) NOPASSWD: ALL') }
    end

    describe file('/etc/sudoers.d/10_10_sudo_ualoc') do
      it { should be_file }
      its(:content) { should include('ualoc ALL=(ALL) ALL') }
    end

    describe file('/etc/sudoers.d/10_10_sudo_varis') do
      it { should be_file }
      its(:content) { should include('userA ALL=(ALL) ALL') }
      its(:content) { should include('userB ALL=(ALL) ALL') }
    end

    describe file('/etc/sudoers.d/10_defaults_requiretty_nrpe') do
      it { should be_file }
      its(:content) { should include('Defaults:nrpe requiretty') }
    end

  end

end
