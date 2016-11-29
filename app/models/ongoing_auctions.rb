# https://www.sitepoint.com/speed-up-with-materialized-views-on-postgresql-and-rails

class OngoingAuctions < ActiveRecord::Base
  self.table_name = 'ongoing_auctions'

  def readonly?
    true
  end

  def self.refresh
    ActiveRecord::Base.connection.execute('REFRESH MATERIALIZED VIEW ongoing_auctions')
  end
end