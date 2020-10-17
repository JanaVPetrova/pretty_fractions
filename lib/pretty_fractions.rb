# frozen_string_literal: true

require 'pretty_fractions/version'

module PrettyFractions
  class Error < StandardError; end

  FRACTIONS = {
    1/4r => '¼',
    1/2r => '½',
    3/4r => '¾',
    1/7r => '⅐',
    1/9r => '⅑',
    1/10r => '⅒',
    1/3r => '⅓',
    2/3r => '⅔',
    1/5r => '⅕',
    2/5r => '⅖',
    3/5r => '⅗',
    4/5r => '⅘',
    1/6r => '⅙',
    5/6r => '⅚',
    1/8r => '⅛',
    3/8r => '⅜',
    5/8r => '⅝',
    7/8r => '⅞'
  }.freeze

  def self.pretty_print(value)
    return '0' if value.zero?

    whole, fraction = value.to_r.divmod(1)

    result_whole = whole.zero? ? nil : whole
    result_fraction = fraction == 0 ? nil : FRACTIONS.fetch(fraction, fraction)

    [result_whole, result_fraction].compact.join
  end
end
