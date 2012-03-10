class AccountsController < ApplicationController
	before_filter :authenticate_user!
end
