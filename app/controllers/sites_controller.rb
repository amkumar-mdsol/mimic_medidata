class SitesController < ApplicationController

  def index
    @sites = Site.all
  end

  def load_sites
    respone = ConfigureSite.new.process
    if respone
      redirect_to sites_path
    else
    end
  end

end
