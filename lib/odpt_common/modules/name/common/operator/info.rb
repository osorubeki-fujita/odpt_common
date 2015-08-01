module OdptCommon::Modules::Name::Common::Operator::Info

  # @!group 鉄道事業者の名称に関するメソッド (1) - 標準の名称（詳細版）

  # 鉄道事業者の標準の名称（日本語・詳細版）
  # @return [::String]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.name_ja_normal_precise }
  #   =>
  #   東京メトロ
  #   都営地下鉄
  #   都営
  #   都電
  #   JR東日本
  #   JR東海
  #   東急電鉄
  #   横浜高速鉄道
  #   小田急電鉄
  #   箱根登山鉄道
  #   西武鉄道
  #   東武鉄道
  #   埼玉高速鉄道
  #   東葉高速鉄道
  #   京王電鉄
  #   京成電鉄
  #   つくばエクスプレス
  #   ゆりかもめ
  #   りんかい線
  def name_ja_normal_precise
    name_ja_to_a.first
  end

  def name_hira_normal_precise
    name_hira_to_a.first
  end

  # 鉄道事業者の標準の名称（ローマ字表記・詳細版）
  # @return [::String]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.name_en_normal_precise }
  #   =>
  #   Tokyo Metro
  #   Toei Subway
  #   Toei
  #   Toden
  #   JR East
  #   JR Central
  #   Tokyu Corporation
  #   Yokohama Minatomirai Railway Company
  #   Odakyu Electric Railway
  #   Hakone Tozan Railway
  #   Seibu Railway
  #   Tobu Railway
  #   Saitama Railway
  #   Toyo Rapid Railway
  #   Keio Corporation
  #   Keisei Electric Railway
  #   Tsukuba Express
  #   Yurikamome
  #   Rinkai Line
  def name_en_normal_precise
    name_en_to_a.first
  end

  # @!group 鉄道事業者の名称に関するメソッド (2) - 標準の名称（簡易版）

  # 標準の名称（日本語・簡易版）
  # @return [::String]
  # @note インスタンス変数 name_ja_short の値が存在する場合は、インスタンス変数 name_ja_short の値を返す。
  # @note インスタンス変数 name_ja_short の値が nil の場合は、name_ja_normal_precise の値を返す。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.name_ja_normal }
  #   =>
  #   東京メトロ
  #   都営
  #   都営
  #   都電
  #   JR
  #   JR
  #   東急
  #   横浜高速鉄道
  #   小田急
  #   箱根登山
  #   西武
  #   東武
  #   埼玉高速鉄道
  #   東葉高速鉄道
  #   京王
  #   京成
  #   つくばエクスプレス
  #   ゆりかもめ
  #   りんかい線
  def name_ja_normal
    name_normal( :ja )
  end

  def name_hira_normal
    name_normal( :hira )
  end

  # 標準の名称（ローマ字表記・簡易版）
  # @return [::String]
  # @note インスタンス変数 name_en_short の値が存在する場合は、インスタンス変数 name_en_short の値を返す。
  # @note インスタンス変数 name_en_short の値が nil の場合は、name_en_normal_precise を返す。
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.name_en_normal }
  #   =>
  #   Tokyo Metro
  #   Toei
  #   Toei
  #   Toden
  #   JR
  #   JR
  #   Tokyu
  #   Yokohama Minatomirai Railway Company
  #   Odakyu
  #   Hakone Tozan
  #   Seibu
  #   Tobu
  #   Saitama Railway
  #   Toyo Rapid Railway
  #   Keio
  #   Keisei
  #   Tsukuba Express
  #   Yurikamome
  #   Rinkai Line
  def name_en_normal
    name_normal( :en )
  end

  # @!group 鉄道事業者の名称に関するメソッド (3) - 乗り換え等の情報で使用

  # 乗り換え等の情報で使用する名称（日本語）
  # @return [::String or nil]
  # @note name_ja_normal の値を返す。
  # @note 例外として、あえて表示をしない場合がある。（例：東京メトロ各線、日暮里・舎人ライナー）
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.name_ja_for_transfer_info }
  #   =>
  #   odpt.Operator:TokyoMetro         : (nil)
  #   odpt.Operator:Toei               : 都営
  #   odpt.Operator:ToeiNipporiToneri  : (nil)
  #   odpt.Operator:Toden              : 都電
  #   odpt.Operator:JR-East            : JR
  #   odpt.Operator:JR-Central         : JR
  #   odpt.Operator:Tokyu              : 東急
  #   odpt.Operator:YokohamaMinatomiraiRailway : 横浜高速鉄道
  #   odpt.Operator:Odakyu             : 小田急
  #   odpt.Operator:HakoneTozan        : 箱根登山
  #   odpt.Operator:Seibu              : 西武
  #   odpt.Operator:Tobu               : 東武
  #   odpt.Operator:SaitamaRailway     : 埼玉高速鉄道
  #   odpt.Operator:ToyoRapidRailway   : 東葉高速鉄道
  #   odpt.Operator:Keio               : 京王
  #   odpt.Operator:Keisei             : 京成
  #   odpt.Operator:MIR                : つくばエクスプレス
  #   odpt.Operator:Yurikamome         : ゆりかもめ
  #   odpt.Operator:TWR                : りんかい線
  def name_ja_for_transfer_info
    name_for_transfer_info( :ja )
  end

  def name_hira_for_transfer_info
    name_for_transfer_info( :hira )
  end

  # 乗り換え等の情報で使用する名称（ローマ字表記）
  # @return [::String or nil]
  # @note name_en_normal の値を返す。
  # @note 例外として、あえて表示をしない場合がある。（例：東京メトロ各線、日暮里・舎人ライナー）
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.same_as.ljust(32) + " : " + operator.name_en_for_transfer_info }
  #   =>
  #   odpt.Operator:TokyoMetro         : (nil)
  #   odpt.Operator:Toei               : Toei
  #   odpt.Operator:ToeiNipporiToneri  : (nil)
  #   odpt.Operator:Toden              : Toden
  #   odpt.Operator:JR-East            : JR
  #   odpt.Operator:JR-Central         : JR
  #   odpt.Operator:Tokyu              : Tokyu
  #   odpt.Operator:YokohamaMinatomiraiRailway : Yokohama Minatomirai Railway Company
  #   odpt.Operator:Odakyu             : Odakyu
  #   odpt.Operator:HakoneTozan        : Hakone Tozan
  #   odpt.Operator:Seibu              : Seibu
  #   odpt.Operator:Tobu               : Tobu
  #   odpt.Operator:SaitamaRailway     : Saitama Railway
  #   odpt.Operator:ToyoRapidRailway   : Toyo Rapid Railway
  #   odpt.Operator:Keio               : Keio
  #   odpt.Operator:Keisei             : Keisei
  #   odpt.Operator:MIR                : Tsukuba Express
  #   odpt.Operator:Yurikamome         : Yurikamome
  #   odpt.Operator:TWR                : Rinkai Line
  def name_en_for_transfer_info
    name_for_transfer_info( :en )
  end

  # @!group 鉄道事業者の名称に関するメソッド (4) - 超詳細

  # 日本語・超詳細版
  # @return [::String]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.name_ja_very_precise }
  #   =>
  #   東京メトロ（東京地下鉄）
  #   都営地下鉄（東京都交通局）
  #   日暮里・舎人ライナー
  #   都電（東京都交通局）
  #   JR東日本（東日本旅客鉄道）
  #   JR東海（東海旅客鉄道）
  #   東急電鉄（東京急行電鉄）
  #   横浜高速鉄道
  #   小田急電鉄
  #   箱根登山鉄道
  #   西武鉄道
  #   東武鉄道
  #   埼玉高速鉄道
  #   東葉高速鉄道
  #   京王電鉄
  #   京成電鉄
  #   つくばエクスプレス（首都圏新都市鉄道）
  #   ゆりかもめ
  #   りんかい線（東京臨海高速鉄道）
  def name_ja_very_precise
    if nippori_toneri_liner?
      "日暮里・舎人ライナー"
    else
      name_very_precise( :ja )
    end
  end

  def name_hira_very_precise
    if nippori_toneri_liner?
      "にっぽり・とねりらいなー"
    else
      name_very_precise( :hira )
    end
  end

  # ローマ字表記・超詳細版
  # @return [::String]
  # @example
  #   ::TokyoMetro::Static.operators.each_value { | operator | puts operator.name_en_very_precise }
  #   =>
  #   Tokyo Metro
  #   Toei Subway (Bureau of Transportation Tokyo Metropolitan Government)
  #   Nippori Toneri Liner
  #   Toden (Bureau of Transportation Tokyo Metropolitan Government)
  #   JR East (East Japan Railway Company)
  #   JR Central (Central Japan Railway Company)
  #   Tokyu Corporation
  #   Yokohama Minatomirai Railway Company
  #   Odakyu Electric Railway
  #   Hakone Tozan Railway
  #   Seibu Railway
  #   Tobu Railway
  #   Saitama Railway
  #   Toyo Rapid Railway
  #   Keio Corporation
  #   Keisei Electric Railway
  #   Tsukuba Express (MIR / Metropolitan Intercity Railway)
  #   Yurikamome
  #   Rinkai Line (TWR / Tokyo Waterfront Area Rapid Transit)
  def name_en_very_precise
    if nippori_toneri_liner?
      "Nippori Toneri Liner"
    else
      name_very_precise( :en )
    end
  end

  # @!group 路線名の個数（別名などがあるか否か）の判定

  [ :ja , :hira , :en ].each do | name_attr |
    eval <<-DEF
      def has_many_name_#{ name_attr }?
        name_#{ name_attr }_to_a.length > 1
      end
    DEF
  end

  private

  def name_normal( name_attr )
    check_validity_of_name_attr( name_attr )
    short = send( "name_#{ name_attr }_short" )

    if short.present?
      short
    else
      send( "name_#{ name_attr }_normal_precise")
    end
  end

  def name_for_transfer_info( name_attr )
    check_validity_of_name_attr( name_attr )
    if this_operator? or nippori_toneri_liner?
      nil
    else
      send( "name_#{ name_attr }_normal")
    end
  end

  def name_very_precise( name_attr )
    check_validity_of_name_attr( name_attr )
    basename = send( "name_#{ name_attr }_normal_precise")

    if send( "has_many_name_#{ name_attr }?" )
      joint_str = name_very_precise_joint_str( name_atr )
      in_parentheses = send( "name_#{ name_attr }_to_a")[ 1..(-1) ].join( joint_str )
      return "#{ basename } #{ in_parentheses }"
    else
      basename
    end
  end

  def name_very_precise_joint_str( name_atr )
    case name_attr
    when :ja , :hira
      "／"
    else
      " / "
    end
  end

  def check_validity_of_name_attr( name_attr )
    raise unless [ :ja , :hira , :en ].include?( name_attr )
  end

end
