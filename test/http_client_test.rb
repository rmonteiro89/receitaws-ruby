require "test_helper"

class Receitaws::HttpClientTest < Minitest::Test
  def test_that_it_returns_an_object
    url = 'www.receitaws.com/consulta'
    stub_request(:get, url).to_return(body: '{}', status: 200)
    consulta = Receitaws::HttpClient.new(cnpj: '27865757000102', url: url)

    assert Hash.new, consulta.get
  end

  def test_that_it_calls_public_api
    requested_url = 'https://www.receitaws.com.br/v1/cnpj/27865757000102'
    stub_request(:get, requested_url).to_return(body: '{}', status: 200)

    Receitaws::HttpClient.new(cnpj: '27865757000102').get

    assert_requested :get, requested_url
  end

  def test_that_it_calls_comercial_api_with_days
    requested_url = 'https://www.receitaws.com.br/v1/cnpj/27865757000102/days/10'
    stub_request(:get, requested_url).to_return(body: '{}', status: 200)

    Receitaws::HttpClient.new(cnpj: '27865757000102', token: 'ABCD', days: 10)
                         .get

    assert_requested :get, requested_url,
                     headers: { Authorization: 'Bearer ABCD' }
  end

  def test_that_it_raise_an_exception_when_cnpj_not_present
    assert_raises 'KeyNotFoundError' do
      Receitaws::HttpClient.new
    end
  end
end