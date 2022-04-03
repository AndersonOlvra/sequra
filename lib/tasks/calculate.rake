namespace :calculate do
  desc "TODO"
  task disbursements: :environment do
    puts "calculating"
    # this task will calculate the disbursements and can be executed every monday using sidekiq or heroku schedule task for exemplo
    Order.where.not(completed: nil)
         .where(created_at: DateTime.current.beginning_of_week..DateTime.current.end_of_week).each do |order|
      puts "calculating..."
      amount = order.amount

      # the disburse is calculated acording with the amount rage
      if (amount < 50.0)
        order.update(disburse: amount * 0.01)
      elsif (amount < 300.0)
        order.update(disburse: amount * 0.0095)
      else
        order.update(disburse: amount * 0.0085)
      end
    end

    puts "finished"
  end
end
