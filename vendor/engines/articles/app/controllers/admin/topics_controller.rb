module Admin
  class TopicsController < Admin::BaseController

    crudify :topic, :xhr_paging => true

  end
end
