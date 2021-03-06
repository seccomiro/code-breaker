# frozen_string_literal: true

module Codebreaker
  class Marker
    def initialize(secret, guess)
      @secret = secret
      @guess = guess
    end

    def exact_match_count
      (0..3).reduce(0) { |count, index| count + (exact_match?(index) ? 1 : 0) }
    end

    def number_match_count
      total_match_count - exact_match_count
    end

    def total_match_count
      secret = @secret.split('')
      @guess.split('').reduce(0) { |count, n| count + (delete_first(secret, n) ? 1 : 0) }
    end

    def delete_first(code, n)
      code.delete_at(code.index(n)) if code.index(n)
    end

    def exact_match?(index)
      @guess[index] == @secret[index]
    end

    def number_match?(index)
      @secret.include?(@guess[index])
    end
  end
end
