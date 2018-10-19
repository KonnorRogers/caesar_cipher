require_relative '../caesar_cipher'

RSpec.describe CaesarCipher do
  let(:cc) { CaesarCipher.new }

  context 'creates a full alphabet' do
    it 'check that it has lower case' do
      expect(CaesarCipher::ALPHABET[25]).to eq 'z'
    end

    it 'check that it has uppercase' do
      expect(CaesarCipher::ALPHABET[-1]).to eq 'Z'
    end
  end

  context '#initialize' do
    it 'creates a caesar_cipher object' do
      expect(cc).to be_an_instance_of CaesarCipher
    end
  end
end
