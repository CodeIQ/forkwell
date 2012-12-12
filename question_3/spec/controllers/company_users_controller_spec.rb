require 'spec_helper'

describe CompanyUsersController do
  context 'without is_admin' do
    describe "POST 'create'" do
      before do
        controller.create position: 'programmer'
      end
      subject { CompanyUser.last }
      it { should_not be_is_admin }
    end
  end

  context 'with is_admin' do
    describe "POST 'create'" do
      it {
        expect {
          controller.create position: 'programmer', is_admin: 'true'
        }.to raise_error ActiveModel::MassAssignmentSecurity::Error
      }
    end
  end
end
