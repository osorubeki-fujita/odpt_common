# 文字列 (String) のクラスに組み込むモジュール
# @note 標準添付ライブラリの拡張
module OdptCommon::StringExt

  def process_train_information_text
    str = self
    str = str.zen_num_to_han
    str = str.zen_alphabet_to_han
    str = str.gsub( /[〜～]/ , " - " )

    regexp_1 = /\A(.+(?:線|ライン)内)で(?:発生した|の)?(?:、?)(.+)のため(?:、?)/
    regexp_2 = /\A(.+(?:線|ライン)) (.+?)駅? - (.+?)駅?間?で(?:発生した|の)?(?:、?)(.+)のため(?:、?)/
    regexp_3 = /\A(.+(?:線|ライン)) (.+?)駅?で(?:発生した|の)?(?:、?)(.+)のため(?:、?)/

    case str
    when regexp_1
      str = str.gsub( regexp_1 ) { "#{ $1 }での#{ $2 }により、" }
    when regexp_2
      str = str.gsub( regexp_2 ) { "#{ $1 } #{ $2 } - #{ $3 } での#{ $4 }により、" }
    when regexp_3
      str = str.gsub( regexp_3 ) { "#{ $1 } #{ $2 }駅での#{ $3 }により、" }
    end

    regexp_cause = /での(.+)により、/
    if regexp_cause =~ str
      case $1
      when "車両点検" , "踏切安全確認"
        str = str.gsub( regexp_cause ) { "で行なった#{ $1 }の影響で、" }
      end
    end

    str = str.gsub( /。\n?(?!\Z)/ , "。\n" )
    str = str.gsub( /に(?=振替輸送を実施しています。)/ , "で" )
    str = str.gsub( /(?<=詳しくは)、(?=駅係員にお尋ねください。)/ , "" )
    str
  end

  def delete_station_subname
    gsub( ::PositiveSupport::RegexpLibrary.regexp_for_parentheses_ja , "" )
  end

  def process_specific_letter
    self
  end

  def station_name_in_title
    delete_station_subname.process_specific_letter
  end

end