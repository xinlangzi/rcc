class AdsController < ApplicationController

  before_filter :find_all_ads
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ad in the line below:
    present(@page)
  end

  def show
    @ad = Ad.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @ad in the line below:
    present(@page)
  end

protected

  def find_all_ads
    @ads = Ad.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/ads").first
  end

end
