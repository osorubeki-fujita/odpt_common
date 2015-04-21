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

  # 16進数の文字列か否かを判定するメソッド
  # @return [Boolean]
  def hex_string?
    /\A[\da-fA-F]+\Z/ === self
  end

# @!group WebColor を表す文字列に対するメソッド

  # WebColorの文字列（"#"なし）であるか否かを判定するメソッド
  # @return [Boolean]
  def is_web_color?
    hex_string? and length == 6
  end

  # WebColor の文字列（"#"あり）であるか否かを判定するメソッド
  # @return [Boolean]
  def is_web_color_with_sharp?
    if /\A\#(.+)\Z/ =~ self
      $1.is_web_color?
    else
      false
    end
  end

  # WebColor の文字列であるか否かを判定するメソッド
  # @return [Boolean]
  def is_improper_web_color?
    is_web_color? or is_web_color_with_sharp?
  end

  # WebColor を RgbColor に変換するメソッド
  # @return [::Array <Integer (natural number)>]
  def to_rgb_color
    unless is_improper_web_color?
      raise "Error"
    end
    gsub( /\#/ , "" ).each_char.each_slice(2).map{ | ary | ary.join.hex }
  end

  # @!endgroup

  def delete_station_subname
    regexp = ::ApplicationHelper.regexp_for_parentheses_normal
    gsub( regexp , "" )
  end

  def process_kouji
    kouji_regexp = ::ApplicationHelper.regexp_for_kouji
    gsub( kouji_regexp , "麴町" )
  end

  def process_specific_letter
    process_kouji
  end

  def station_name_in_title
    delete_station_subname.process_specific_letter
  end
end