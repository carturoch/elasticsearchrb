# frozen_string_literal: true

require 'elasticsearch'

class Client
  MAPPINGS = {
    properties: {
      title: { type: 'text', analyzer: 'stop' },
      content: { type: 'text', analyzer: 'snowball' },
      created_at: { type: 'date' }
    }
  }.freeze

  def initialize(elasticsearch_client:, index_name:)
    self.client = elasticsearch_client
    self.name = index_name
  end

  def create_index
    client.indices.create(
      index: name,
      body: { mappings: MAPPINGS }
    )
  end

  private

  attr_accessor :client
  attr_accessor :name
end
