class Product < ApplicationRecord
    
    belongs_to :category
    has_many :bids
    has_one :products_under_bid
    
    validates_presence_of :category
    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :name, presence: true
    validates :date_added, presence: true
    has_attached_file :image, styles: { original: ["320x160#", :jpg], thumb: ["64x32#", :jpg] }, :default_url => "https://placehold.it/64x32", :storage => :s3, :s3_credentials => {access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], s3_region: ENV['AWS_S3_REGION']}, :bucket => ENV['S3_BUCKET_NAME']
    validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..200.kilobytes }
    self.primary_key = 'product_id'
    
end
