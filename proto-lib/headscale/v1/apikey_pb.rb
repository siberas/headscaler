# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: headscale/v1/apikey.proto

require 'google/protobuf'

require 'google/protobuf/timestamp_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("headscale/v1/apikey.proto", :syntax => :proto3) do
    add_message "headscale.v1.ApiKey" do
      optional :id, :uint64, 1
      optional :prefix, :string, 2
      optional :expiration, :message, 3, "google.protobuf.Timestamp"
      optional :created_at, :message, 4, "google.protobuf.Timestamp"
      optional :last_seen, :message, 5, "google.protobuf.Timestamp"
    end
    add_message "headscale.v1.CreateApiKeyRequest" do
      optional :expiration, :message, 1, "google.protobuf.Timestamp"
    end
    add_message "headscale.v1.CreateApiKeyResponse" do
      optional :api_key, :string, 1
    end
    add_message "headscale.v1.ExpireApiKeyRequest" do
      optional :prefix, :string, 1
    end
    add_message "headscale.v1.ExpireApiKeyResponse" do
    end
    add_message "headscale.v1.ListApiKeysRequest" do
    end
    add_message "headscale.v1.ListApiKeysResponse" do
      repeated :api_keys, :message, 1, "headscale.v1.ApiKey"
    end
  end
end

module Headscale
  module V1
    ApiKey = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.ApiKey").msgclass
    CreateApiKeyRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.CreateApiKeyRequest").msgclass
    CreateApiKeyResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.CreateApiKeyResponse").msgclass
    ExpireApiKeyRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.ExpireApiKeyRequest").msgclass
    ExpireApiKeyResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.ExpireApiKeyResponse").msgclass
    ListApiKeysRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.ListApiKeysRequest").msgclass
    ListApiKeysResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("headscale.v1.ListApiKeysResponse").msgclass
  end
end
