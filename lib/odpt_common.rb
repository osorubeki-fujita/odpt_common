require "odpt_common/version"

require "active_support"
require "active_support/core_ext"

require "odpt_common/calc_time"
require "odpt_common/station_timetables"
require "odpt_common/station_timetables/group_by_railway_direction"
require "odpt_common/station_timetables/group_by_railway_line"
require "odpt_common/string_ext"

module OdptCommon

  extend ::ActiveSupport::Concern

  included do

    [ :String ].each do | class_name |
      eval <<-INCLUDE
        ::#{ class_name }.class_eval do
          include ::OdptCommon::#{ class_name }Ext
        end
      INCLUDE
    end

  end

end

include OdptCommon