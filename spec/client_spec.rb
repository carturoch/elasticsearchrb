# frozen_string_literal: true

require 'spec_helper'
require_relative '../src/client'
require 'elasticsearch'

RSpec.describe Client do
  let(:elasticsearch_client) do
    Elasticsearch::Client.new(
      host: 'http://localhost:9200',
      log: true
    )
  end

  describe 'index manipulation' do
    subject(:client) do
      described_class.new(
        elasticsearch_client: elasticsearch_client,
        index_name: 'posts_4223'
      )
    end

    it 'creates the given index' do
      expect(client.create_index).to be_a Hash
    end
  end
end
