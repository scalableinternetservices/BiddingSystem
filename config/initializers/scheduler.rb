require 'rufus-scheduler'

s = Rufus::Scheduler.singleton


s.every '2m' do
    ProductsUnderBid.decide_winner_when_bid_time_ends
end