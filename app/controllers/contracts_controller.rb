class ContractsController < ApplicationController
  def index
    @contracts = current_user.contracts
  end
end
