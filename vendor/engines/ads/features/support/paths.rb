module NavigationHelpers
  module Refinery
    module Ads
      def path_to(page_name)
        case page_name
        when /the list of ads/
          admin_ads_path

         when /the new ad form/
          new_admin_ad_path
        else
          nil
        end
      end
    end
  end
end
