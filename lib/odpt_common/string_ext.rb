# 文字列 (String) のクラスに組み込むモジュール
# @note 標準添付ライブラリの拡張
module OdptCommon::StringExt

  def process_train_operation_text
    str = self
    str = str.zen_num_to_han
    str = str.zen_alphabet_to_han
    str = str.gsub( /[〜～]/ , " - " )

    regexp_1 = /\A(.+(?:線|ライン)内)で(?:発生した|の)?(?:、?)(.+)のため(?:、?)/
    regexp_2 = /\A(.+(?:線|ライン)) (.+?)駅? - (.+?)駅?間?で(?:発生した|の)?(?:、?)(.+)のため(?:、?)/
    regexp_3 = /\A(.+(?:線|ライン)) (.+?)駅?で(?:発生した|の)?(?:、?)(.+)のため(?:、?)/

    regexp_natural_disaster = /(\d{1,2}時\d{1,2}分頃)、(地震)のため、((?:一部の列車に)?遅れが出ています。)/

    regexp_cause = /での(.+)により、/
    
    regexp_furikae = /に(?=振替輸送を実施しています。)/

    case str
    when regexp_1
      str = str.gsub( regexp_1 ) { "#{ $1 }での#{ $2 }により、" }
    when regexp_2
      str = str.gsub( regexp_2 ) { "#{ $1 } #{ $2 } - #{ $3 } での#{ $4 }により、" }
    when regexp_3
      str = str.gsub( regexp_3 ) { "#{ $1 } #{ $2 }駅での#{ $3 }により、" }
    end

    str = str.gsub( regexp_natural_disaster ) { "#{ $1 }発生した#{ $2 }のため、#{ $3 }" }

    if regexp_cause =~ str
      case $1
      when "車両点検" , "踏切安全確認"
        str = str.gsub( regexp_cause ) { "で行なった#{ $1 }の影響で、" }
      end
    end

    str = str.gsub( regexp_furikae , "で" )
    # str = str.gsub( regexp_furikae , "への" )
    
    # cf. 東急田園都市線内での東急線内遅延により、一部の列車に遅れが出ています。
    regexp_for_invalid_railway_line_info_of_another_operator = /(.+)線内での(.+)線内遅延により、/
    if regexp_for_invalid_railway_line_info_of_another_operator =~ str
      railway_line_name_precise , operator_name = $1 , $2
      if /\A#{ operator_name }/ === railway_line_name_precise
        str = str.gsub( regexp_for_invalid_railway_line_info_of_another_operator ) { "#{ $1 }線内での遅延により、" }
      end
    end

    str = str.gsub( /(?<=つくばエクスプレス|ゆりかもめ)線/ , "" )
    str = str.gsub( /。\n? ?(?!\Z)/ , "。\n" )
    
    str = str.gsub( /(?<=詳しくは)、(?=駅係員にお尋ねください。)/ , "" )
    str
  end

  def process_machine_dependent_character
    self
  end

  def revive_machine_dependent_character
    self
  end

  def delete_station_subname
    gsub( ::PositiveStringSupport::RegexpLibrary.regexp_for_parentheses_ja , "" )
  end

end
