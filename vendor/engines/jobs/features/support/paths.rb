module NavigationHelpers
  module Refinery
    module Jobs
      def path_to(page_name)
        case page_name
        when /the list of jobs/
          admin_jobs_path

         when /the new job form/
          new_admin_job_path
        else
          nil
        end
      end
    end
  end
end
