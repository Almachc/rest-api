class PoliciesController < ApplicationController
  def index
    policies = Policy.all

    render json: policies
  end

  def show
    policy = Policy.find(params[:id])

    render json: policy
  end
end
