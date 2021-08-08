class AdminController < ApplicationController
  before_action :verify_admin!

  private

    def verify_admin!
      # do something
    end
end
