module Admin
  class AdsController < Admin::BaseController

    crudify :ad,
            :title_attribute => 'link', :xhr_paging => true

  end
end
