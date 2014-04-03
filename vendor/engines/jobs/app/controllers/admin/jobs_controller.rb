module Admin
  class JobsController < Admin::BaseController

    crudify :job, :xhr_paging => true

  end
end
