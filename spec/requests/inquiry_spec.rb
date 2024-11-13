# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Inquiry' do
  describe 'GET /inquiries/new' do
    context 'with turbo_stream format' do
      before { get new_inquiry_path, as: :turbo_stream }

      it 'responds with turbo_stream' do
        expect(response.media_type).to eq('text/vnd.turbo-stream.html')
      end

      it 'replaces inquiry_form with form partial' do
        expect(response.body).to include('turbo-stream action="replace" target="inquiry_form"')
                             .and include('<turbo-frame id="inquiry_form">')
      end
    end

    context 'with HTML format' do
      before { get new_inquiry_path }

      it 'responds with HTML' do
        expect(response.media_type).to eq('text/html')
      end

      it 'responds with the form html' do
        expect(response.body).to include('web_inquiry_form')
      end

      it 'assigns the kind' do
        expect(response.body).to include('value="basic"')
      end
    end
  end

  describe 'GET /cancel' do
    subject(:make_request) { get cancel_inquiries_path, as: :turbo_stream }

    before { make_request }

    it 'responds with turbo_stream' do
      expect(response.media_type).to eq('text/vnd.turbo-stream.html')
    end

    it 'replaces inquiry_form' do
      expect(response.body).to include('turbo-stream action="replace" target="inquiry_form"')
    end

    it 'renders the new inquiry type buttons' do
      expect(response.body).to include('inquiry-buttons')
    end
  end
end
