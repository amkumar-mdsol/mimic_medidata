require 'rest-client'

class ConfigureSite
  SITE_SERVICE = 'http://localhost:3001'

  def initialize
    @response = RestClient.get("#{SITE_SERVICE}/sites/all_sites")
    binding.pry
  end

  def process
    @sites = JSON.parse(@response.body)
    @sites.each do |site|
      next if Site.find_by_site_uuid(site['site_uuid'])
      new_site = Site.new(
        name: site['name'],
        site_uuid: site['site_uuid'],
        location: site['location'],
        phone: site['phone'],
        email: site['email'],
        study_uuid: site['study_uuid'] 
        )
      new_site.save
    end
  end
end