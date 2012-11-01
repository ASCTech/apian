require "apian/version"

module Apian
  module ModelExtensions
    extend ActiveSupport::Concern

    included do
      before_validation :randomize_key
      validates_presence_of :key, :name
      validates_uniqueness_of :key, :name
    end

    def randomize_key
      self.key = SecureRandom.hex(16)
    end

    module ClassMethods
      def lookup_id_for(api_key)
        puts api_key
        Rails.cache.fetch "service_id_for #{api_key}" do
          find_by_key(api_key).try(:id)
        end
      end
    end
  end

  module ControllerExtensions
    def api_key
      request.headers["X-API-Key"] || raise("API Key not provided")
    end
    def forbidden
      self.status = 403
      self.response_body = "API Key Not Found"
    end
  end


end
