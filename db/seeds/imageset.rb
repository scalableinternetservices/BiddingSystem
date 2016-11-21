# AWS CLI needs to be installed and configured
#   [*] http://docs.aws.amazon.com/cli/latest/userguide/installing.html
#   [*] sudo pip install awscli
#   [*] aws configure

# We assume that <S3_bucket>/BiddingSystem/products/images/000 contains the required files
# We'll infer directory names associated to products using id partitioning
# Paperclip uses id partitioning to store files
#   [*] http://stackoverflow.com/questions/15494906/understanding-id-partition-in-paperclip
#   [*] https://github.com/thoughtbot/paperclip/blob/master/lib/paperclip/interpolations.rb#L162

# We'll use aws-cli cp command to copy the contents of 000 directory to newly create ones
# It should be order of magnitude faster as it copies an S3 object in the same bucket
# rather than uploading the same file over and over again
#   [*] http://docs.aws.amazon.com/cli/latest/reference/s3/cp.html


# Validate for required parameters
imageset_size = ENV["size"].to_i
abort("Specify the size of the image set: \n>>\t rails db:seed:imageset size=<imageset_size>") if imageset_size == 0

for product_id in 1..imageset_size
    id_part = ("%09d".freeze % product_id).scan(/\d{3}/).join("/".freeze)
    system "aws s3 cp s3://cs291/BiddingSystem/products/images/000/000/000 s3://cs291/BiddingSystem/products/images/#{id_part} --acl public-read-write --recursive"
end