# API などのデータの情報を扱う各クラスに組み込むモジュール
module OdptCommon
end

require "odpt_common/version"
require "odpt_common/calc_time"
require "odpt_common/station_timetables"
require "odpt_common/station_timetables/group_by_railway_direction"
require "odpt_common/station_timetables/group_by_railway_line"
require "odpt_common/string_ext"

class String
  include ::OdptCommon::StringExt
end