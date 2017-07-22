require "test_helper"

class ReceitawsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Receitaws::VERSION
  end

  def test_consulta_cnpj_success
    stub_request(:get, 'https://www.receitaws.com.br/v1/cnpj/27865757000102')
      .to_return(body: receitaws_api_response, status: 200)


    consulta = Receitaws::Api.consulta('27865757000102')

    assert consulta.is_a?(Receitaws::Consulta)
    assert_equal atividade_principal_array, consulta.atividade_principal
    assert_equal 'ATIVA', consulta.situacao
  end

  def atividade_principal_array
    [
      {
        "text" => "Atividades de televisão aberta",
        "code" => "60.21-7-00"
      }
    ]
  end

  def receitaws_api_response
      '{
        "atividade_principal": [
          {
            "text": "Atividades de televisão aberta",
            "code": "60.21-7-00"
          }
        ],
        "data_situacao": "03/11/2005",
        "nome": "GLOBO COMUNICACAO E PARTICIPACOES S/A",
        "uf": "RJ",
        "telefone": "(21) 2540-2623",
        "atividades_secundarias": [
          {
            "text": "Reprodução de vídeo em qualquer suporte",
            "code": "18.30-0-02"
          },
          {
            "text": "Portais, provedores de conteúdo e outros serviços de informação na internet",
            "code": "63.19-4-00"
          },
          {
            "text": "Agenciamento de espaços para publicidade, exceto em veículos de comunicação",
            "code": "73.12-2-00"
          },
          {
            "text": "Programadoras",
            "code": "60.22-5-01"
          }
        ],
        "qsa": [
          {
            "qual": "10-Diretor",
            "nome": "CARLOS HENRIQUE SCHRODER"
          },
          {
            "qual": "10-Diretor",
            "nome": "JORGE LUIZ DE BARROS NOBREGA"
          },
          {
            "qual": "10-Diretor",
            "nome": "ROSSANA FONTENELE BERTO"
          },
          {
            "qual": "10-Diretor",
            "nome": "ALI AHAMAD KAMEL ALI HARFOUCHE"
          },
          {
            "qual": "10-Diretor",
            "nome": "WILLY HAAS FILHO"
          },
          {
            "qual": "10-Diretor",
            "nome": "JUAREZ DE QUEIROZ CAMPOS JUNIOR"
          },
          {
            "qual": "10-Diretor",
            "nome": "SERGIO LOURENCO MARQUES"
          },
          {
            "qual": "10-Diretor",
            "nome": "MARCELO LUIS MENDES SOARES DA SILVA"
          },
          {
            "qual": "10-Diretor",
            "nome": "ANTONIO CLAUDIO FERREIRA NETTO"
          },
          {
            "qual": "10-Diretor",
            "nome": "CRISTIANE DELECRODE LOPES SUT RIBEIRO"
          }
        ],
        "situacao": "ATIVA",
        "bairro": "JARDIM BOTANICO",
        "logradouro": "R LOPES QUINTAS",
        "numero": "303",
        "cep": "22.460-901",
        "municipio": "RIO DE JANEIRO",
        "abertura": "31/01/1986",
        "natureza_juridica": "205-4 - Sociedade Anônima Fechada",
        "fantasia": "GCP,TV GLOBO, REDE GLOBO, GLOBO.COM, SOM LIVRE",
        "cnpj": "27.865.757/0001-02",
        "ultima_atualizacao": "2017-07-14T06:16:40.885Z",
        "status": "OK",
        "tipo": "MATRIZ",
        "complemento": "",
        "email": "",
        "efr": "",
        "motivo_situacao": "",
        "situacao_especial": "",
        "data_situacao_especial": "",
        "capital_social": "6408935530.37",
        "extra": {}
      }'
  end
end
