require "refile/s3"

aws = {
  access_key_id: "AKIAIQQ4CYLII36WORPA",
  secret_access_key: "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",
  region: "ap-northeast-1",
  bucket: "websuku201707-task5store",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)

