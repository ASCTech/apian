require "apian/version"

module Apian
  include ActiveSupport::Concern

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
      Rails.cache.fetch "service_id_for #{api_key}" do
        find_by_key(api_key).try(:id)
      end
    end
  end
end
