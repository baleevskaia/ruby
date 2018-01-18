class PublicPagesController < ApplicationController
  before_action :anonymous_user!, only: [:login]
  before_action :authenticate_user!, only: [:logout]

  def login
  end

  def logout
    session[:userinfo] = nil;
    authenticate_user!()
    print 'ddddd'
  end
end
