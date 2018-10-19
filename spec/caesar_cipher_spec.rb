# frozen_string_literal: true

require_relative '../caesar_cipher'

RSpec.describe CaesarCipher do
  let(:cc) { CaesarCipher.new }

  context 'creates a full alphabet' do
    it 'check that it has lower case' do
      expect(CaesarCipher.alphabet[25]).to eq 'z'
    end

    it 'check that it has uppercase' do
      expect(CaesarCipher.alphabet[-1]).to eq 'Z'
    end
  end

  context '#initialize' do
    it 'creates a caesar_cipher object' do
      expect(cc).to be_an_instance_of CaesarCipher
    end
  end

  context 'encrypt(shift, text)' do
    it 'wraps around' do
      expect cc.encrypt(shift: 2, text: 'z x ab').to eq 'b a ce'
    end

    it 'accounts for  > 26' do
      expect cc.encrypt(shift: 27, text: 'abc').to eq 'cde'
    end

    it 'accounts for negative numbers' do
      expect cc.encrypt(shift: -2, text: 'ab').to eq 'xy'
    end

    it 'accounts for uppercase letters' do
      expect cc.encrypt(shift: 3, text: 'Z X A b c'). to eq 'C B D e f'
    end

    it 'raises an argument error if shift is not an integer' do
      expect { cc.encrypt(shift: 'h', text: 'y') }.to raise_error ArgumentError
    end

    it 'raises an ArgumentError if text is not a string' do
      expect { cc.encrypt(shift: 2, text: not_string) }.to raise_error ArgumentError
    end
  end
end
