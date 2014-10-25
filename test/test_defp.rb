require 'minitest/autorun'
require 'CallBaecker'

require 'defp'

class Setup
  extend Defp
  include CallBaecker

  def defp_normal_params(value1, value2)
  defp('hallo', false) == 'bubu1'
  defp(_, 'hallo') == -> {
    'bubu2'
  }
    'bubu3'
  end

  def self.defp_normal_params(value1, value2)
  defp('hallo', false) == 'bubu1'
  defp(_, 'hallo') == -> {
    'bubu2'
  }
    'bubu3'
  end

  def self.defp_hash_params(value1: ,value2:)
    defp(value1: 'hallo', value2: _) == 'bubu1'
    defp(value2: 'hallo') == -> { 'bubu2' }
      'bubu3'
  end

  def self.defp_multi_params(value1 = {}, value2, value3)
    defp({value2: 'hallo'}, 'dud', _) == 'bubu1'
    'bubu2'
  end
end

class DefpTest < Minitest::Test
  def test_instance_method
    assert_equal Setup.new.defp_normal_params('value', 'value'), 'bubu3'
  end

  def test_normal_param_not_matched
    assert_equal Setup.defp_normal_params('value', 'value'), 'bubu3'
  end

  def test_normal_param_matched
    assert_equal Setup.defp_normal_params('hallo', 'value'), 'bubu1'
  end

  def test_normal_param_matched_with_blank
    assert_equal Setup.defp_normal_params('hallo', 'hallo'), 'bubu1'
  end

  def test_normal_param_matched_given_block
    assert_equal Setup.defp_normal_params('value', 'hallo'), 'bubu2'
  end

  def test_hash_param
    assert_equal Setup.defp_hash_params(value1: 'hallo', value2: 'dud'), 'bubu1'
  end

  def test_hash_param_two
    assert_equal Setup.defp_hash_params(value2: 'hallo', value1: 'dud'), 'bubu2'
  end

  def test_mixed_params
    assert_equal Setup.defp_multi_params({value2: 'hallo'}, 'dud', 'kuk'), 'bubu1'
  end
end
