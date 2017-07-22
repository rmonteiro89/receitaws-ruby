require "test_helper"

class Receitaws::ConsultaTest < Minitest::Test
  def test_to_h
    hash = { id: 123 }

    consulta = Receitaws::Consulta.new(hash)

    assert_equal hash, consulta.to_h
  end

  def test_transform_any_key_value_in_a_method
    hash = { id: 123, name: 'ABC' }

    consulta = Receitaws::Consulta.new(hash)

    assert_equal 123, consulta.id
    assert_equal 'ABC', consulta.name
  end
end