module Api
    module V1
        class DisbursementsSerializer < ActiveModel::Serializer
            attributes :round_disburse,
                       :amount,                       
                       :merchant_name,
                       :shopper_name,
                       :status,
                       :created,
                       :completed

            def merchant_name
                # showing the merchant name to help the client to identify without need a new request
                Merchant.find(object.merchant_id).name
            end

            def shopper_name
                # showing the shopper name to help the client to identify without need a new request
                Shopper.find(object.shopper_id).name
            end

            def round_disburse
                # rouding the disburse just to a friendly show but without change the real value storaged
                object.disburse.round(2)
            end
        end
    end
end