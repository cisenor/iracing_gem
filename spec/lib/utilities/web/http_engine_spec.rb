require 'utilities/web/http_engine'

module IRacing
  RSpec.describe IRacing::HTTPEngine do
    let(:stubs)  { Faraday::Adapter::Test::Stubs.new }
    let(:conn)   { Faraday.new { |b| b.adapter(:test, stubs) } }
    let(:instance) { HTTPEngine.new(conn: conn) }
    describe 'send_get_request' do
      let(:url) { 'http://example.com' }
      subject { instance.send_get_request(url: url) }

      it 'returns a HTTPResponse object' do
        stubs.get(url) { [200, {}] }
        expect(subject).to be_a HTTPResponse
      end

      it 'will return a 200' do
        stubs.get(url) { [200, {}] }
        expect(subject.status).to eq 200
      end
    end
  end
end