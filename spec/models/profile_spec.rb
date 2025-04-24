require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'belongs to user' do
    expect(described_class.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

  it 'has one attached avatar' do
    expect(described_class.reflect_on_attachment(:avatar)).to be_present
  end

  it 'validates attached avatar' do
    validator_classes = described_class.validators_on(:avatar).map(&:class)
    expect(validator_classes).to include(ActiveStorageValidations::AttachedValidator)
  end

  it 'validates avatar content type' do
    ct_validator = described_class.validators_on(:avatar).find { |v| v.is_a?(ActiveStorageValidations::ContentTypeValidator) }
    expect(ct_validator.options[:content_type] || ct_validator.options[:in]).to match_array(['image/png', 'image/jpg', 'image/jpeg'])
  end

  it 'validates avatar size limit' do
    size_validator = described_class.validators_on(:avatar).find { |v| v.is_a?(ActiveStorageValidations::SizeValidator) }
    expect(size_validator.options[:less_than]).to eq(5.megabytes)
  end

  it 'validates bio length maximum' do
    length_validator = described_class.validators_on(:bio).find { |v| v.is_a?(ActiveModel::Validations::LengthValidator) }
    expect(length_validator.options[:maximum]).to eq(234)
  end
end
