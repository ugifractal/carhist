require "shrine"
require "shrine/storage/file_system"
# require 'shrine/storage/s3'

# s3_options = {
#   bucket: ENV.fetch('S3_BUCKET'), # required
#   region: ENV.fetch('S3_REGION'), # required
#   access_key_id: ENV.fetch('S3_ACCESS_KEY'),
#   secret_access_key: ENV.fetch('S3_SECRET_KEY'),
#   # endpoint: ENV.fetch('S3_ENDPOINT'),
#   force_path_style: true
# }

# Shrine.storages = {
#   cache: Shrine::Storage::S3.new(prefix: "cache", public: true, **s3_options),
#   store: Shrine::Storage::S3.new(prefix: "store", public: true, **s3_options)
# }

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files