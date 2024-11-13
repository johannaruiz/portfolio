# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inquiry do
  let(:basic_inquiry) { build(:inquiry) }
  let(:employment_inquiry) { build(:inquiry, :employment) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to allow_value('email@example.com').for(:email) }
  it { is_expected.not_to allow_value('invalid_email').for(:email) }
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to define_enum_for(:kind).with_values(basic: 0, employment: 1) }

  describe 'inquiry kind:basic' do
    it 'is valid' do
      expect(basic_inquiry).to be_valid
    end

    it 'has the value basic for kind' do
      expect(basic_inquiry.kind).to eq('basic')
    end

    it 'has no value for phone' do
      expect(basic_inquiry.phone).to be_nil
    end

    it 'has no value for company' do
      expect(basic_inquiry.company).to be_nil
    end
  end

  describe 'inquiry kind:employment' do
    it 'is valid' do
      expect(employment_inquiry).to be_valid
    end

    it 'has the value employment for kind' do
      expect(employment_inquiry.kind).to eq('employment')
    end

    it 'has a value for phone' do
      expect(employment_inquiry.phone).to be_present
    end

    it 'has a value for company' do
      expect(employment_inquiry.company).to eq('RCorp')
    end
  end

  it 'allows valid kinds' do
    expect { employment_inquiry.kind = 'employment' }.not_to raise_error
  end

  it 'raises error for invalid kind' do
    expect { employment_inquiry.kind = 'invalid_kind' }.to raise_error(ArgumentError)
  end

  context 'when sanitizing text attributes' do
    let(:inquiry) { build(:inquiry, name: '<h1>John Doe</h1>', message: '<script>alert("message");</script>') }

    it 'sanitizes the name attribute before saving' do
      inquiry.save
      expect(inquiry.name).to eq('John Doe')
    end

    it 'sanitizes the message attribute before saving' do
      inquiry.save
      expect(inquiry.message).to eq('')
    end
  end

  it 'does not modify non-string attributes' do
    expect { basic_inquiry.save }.not_to change(basic_inquiry, :kind)
  end
end
