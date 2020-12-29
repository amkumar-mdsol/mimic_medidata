require 'rails_helper'

RSpec.describe ConfigureSite, type: :service do |config|

  describe '#process' do
    let!(:site_uuid) { "48e45878-0113-4cd3-a4cd-bdb6d8f09568" }
    let!(:sites) { 
      [
        { 
          name: 'my_site',
          site_uuid: site_uuid,
          location: 'our_location',
          phone: nil,
          email: nil,
          study_uuid: SecureRandom.uuid, 
        }
      ]
    }
    context 'when API respods with a success response' do
      before do
        stub_request(:get, "#{ConfigureSite::SITE_SERVICE}/sites/all_sites").
        to_return(status: 200, body: sites.to_json)
      end  
      it 'does create sites' do
        ConfigureSite.new.process

        expect(Site.first.site_uuid).to eq(site_uuid)
      end
    end
  end
end