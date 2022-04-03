module Api
    module V1
        class DisbursementsController < ApplicationController
            def index
                # getting the disbursements and serializing the results
                render json: search_disbursements, each_serializer: DisbursementsSerializer
            end

            private

            def search_disbursements
                orders = Order.where.not(disburse: nil) # getting all orders that have disbursements
                # getting the disbursements by merchant if the marchant name are informed
                orders = orders.joins(:merchant).where(merchant: { name: params[:merchant] }) if params[:merchant] 

                orders
            end
        end
    end
end