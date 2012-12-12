class CompanyUsersController < ApplicationController
  def create(company_user)
    CompanyUser.create! company_user
  end
end
