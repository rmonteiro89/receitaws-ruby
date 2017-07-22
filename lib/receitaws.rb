require 'receitaws/version'
require 'receitaws/http_client'
require 'receitaws/consulta'
require 'rest-client'
require 'json'

module Receitaws
  @api_url = 'https://www.receitaws.com.br'
  @api_version = 'v1'

  class << self
    attr_reader :api_url, :api_version
    attr_accessor :api_token
  end

  class Api
    def self.consulta(cnpj, options = {})
      response = Receitaws::HttpClient.new(options.merge(cnpj: cnpj)).get
      Receitaws::Consulta.new(response)
    end
  end
end
