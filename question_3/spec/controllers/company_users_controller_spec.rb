require 'spec_helper'

describe CompanyUsersController do
  describe "POST 'create'" do
    before do
      post :create
    end
    its(:response) { should be_success }
  end
end
