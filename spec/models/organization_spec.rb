require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'Presence validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :type }
    it { should validate_presence_of :tax_number }
    it { should validate_presence_of :reg_number }
  end

  # describe 'Uniqueness validations' do
  #   %i[title tax_number reg_number].each do |attr|
  #     subject { create(:organization) }
  #     it { should validate_uniqueness_of attr }
  #   end
  # end

  describe 'Numericality(only integer) validations' do
    it { should validate_numericality_of(:tax_number).only_integer }
    it { should validate_numericality_of(:reg_number).only_integer }
  end

  # describe 'Length validations' do
  #   subject { create(:organization) }
  #   it { should validate_length_of(:tax_number).is_equal_to(9) }
  #   it { should validate_length_of(:reg_number).is_equal_to(13) }
  # end
end
