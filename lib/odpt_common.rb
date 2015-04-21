require "odpt_common/version"

::Dir.glob( "#{ __FILE__ }/**/**.rb" ).sort.each do | filename |
  require filename
end

# API などのデータの情報を扱う各クラスに組み込むモジュール
module OdptCommon
end