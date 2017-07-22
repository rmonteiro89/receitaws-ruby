module Receitaws
  class HttpClient
    DEFAULT_DAYS = 30

    def initialize(params = {})
      @cnpj = params.fetch(:cnpj)
      @api_url = params.fetch(:url, nil)
      @days = params.fetch(:days, DEFAULT_DAYS)
      @token = params.fetch(:token, Receitaws.api_token)
      @http_client = params.fetch(:http_client, RestClient)
    end

    def get
      JSON.parse @http_client.get(api_url, header)
    end

    private

    def api_url
      @api_url ||= build_url
    end

    def build_url
      if !@token.nil?
        url_base + comercial_url
      else
        url_base + public_url
      end
    end

    def url_base
      "#{Receitaws.api_url}/#{Receitaws.api_version}"
    end

    def public_url
      "/cnpj/#{@cnpj}"
    end

    def comercial_url
      "/cnpj/#{@cnpj}/days/#{@days}"
    end

    def header
      !@token.nil? ? { Authorization: "Bearer #{@token}" } : {}
    end
  end
end