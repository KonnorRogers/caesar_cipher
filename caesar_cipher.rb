# frozen_string_literal: true

# Encrypts & Decrypts plain text
class CaesarCipher
  def initialize
    @alphabet = [*('a'..'z'), *('A'..'Z')].join
  end

  def check_args(shift:, text:)
    raise ArgumentError unless shift.is_a? Integer
    raise ArgumentError unless text.is_a? String
  end

  def encrypt(shift:, text:)
    check_args(shift: shift, text: text)
    text.tr(make_cipher, @alphabet)
  end

  def decrypt(shift:, text:)
    check_args(shift: shift, text: text)
    text.tr(@alphabet, make_cipher)
  end

  private

  def make_cipher
    # duplicate alphabet, create array of chars, rotate(n) times
    # join to make a string
    @alphabet.dup.chars.rotate(shift).join
  end
end
