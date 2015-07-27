module OdptCommon::Modules::Name::Common::RailwayLine::Info

  # @!group 判定 - 名称（日本語）

  def has_name_ja?
    name_ja_to_a.present?
  end

  def has_one_name_ja?
    name_ja_to_a.length == 1
  end

  def has_many_name_ja?
    name_ja_to_a.length > 1
  end

  # @!group 判定 - 名称（ローマ字）

  def has_name_en?
    name_en_to_a.present?
  end

  def has_one_name_en?
    name_en_to_a.length == 1
  end

  def has_many_name_en?
    name_en_to_a.length > 1
  end

  # @!group 判定 - 路線記号

  def has_code_infos?
    codes_to_a.present?
  end

  def has_one_code_info?
    _codes_to_a = codes_to_a
    _codes_to_a.present? and _codes_to_a.length == 1
  end

  def has_many_code_infos?
    _codes_to_a = codes_to_a
    _codes_to_a.present? and _codes_to_a.length > 1
  end

  # @!group 路線名に関するメソッド (2) - 標準（路線名のみ）

  # 路線名（標準・日本語表記・路線名のみ）を取得するメソッド
  # @return [String] 路線名（インスタンス変数 name）が定義されている場合
  # @return [nil] 路線名（インスタンス変数 name）が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts same_as.ljust(48) + " : " + railway_line.name_ja_normal }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : 銀座線
  #   odpt.Railway:TokyoMetro.Marunouchi               : 丸ノ内線
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : 丸ノ内線（中野坂上 - 方南町）
  #   odpt.Railway:TokyoMetro.Hibiya                   : 日比谷線
  #   odpt.Railway:TokyoMetro.Tozai                    : 東西線
  #   odpt.Railway:TokyoMetro.Chiyoda                  : 千代田線
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : 千代田線（綾瀬 - 北綾瀬）
  #   odpt.Railway:TokyoMetro.Yurakucho                : 有楽町線
  #   odpt.Railway:TokyoMetro.Hanzomon                 : 半蔵門線
  #   odpt.Railway:TokyoMetro.Namboku                  : 南北線
  #   odpt.Railway:TokyoMetro.Fukutoshin               : 副都心線
  #   odpt.Railway:Toei.Asakusa                        : 浅草線
  #   odpt.Railway:Toei.Mita                           : 三田線
  #   odpt.Railway:Toei.Shinjuku                       : 新宿線
  #   odpt.Railway:Toei.Oedo                           : 大江戸線
  #   odpt.Railway:Toei.NipporiToneri                  : 日暮里・舎人ライナー
  #   odpt.Railway:Toei.TodenArakawa                   : 荒川線
  #   odpt.Railway:JR-East                             : JR各線
  #   odpt.Railway:JR-East.Yamanote                    : 山手線
  #   odpt.Railway:JR-East.KeihinTohoku                : 京浜東北線
  #   odpt.Railway:JR-East.Tokaido                     : 東海道線
  #   odpt.Railway:JR-East.Yokosuka                    : 横須賀線
  #   odpt.Railway:JR-East.Takasaki                    : 高崎線
  #   odpt.Railway:JR-East.Utsunomiya                  : 宇都宮線
  #   odpt.Railway:JR-East.ShonanShinjuku              : 湘南新宿ライン
  #   odpt.Railway:JR-East.UenoTokyo                   : 上野東京ライン
  #   odpt.Railway:JR-East.Chuo                        : 中央線 特急
  #   odpt.Railway:JR-East.ChuoKaisoku                 : 中央線 快速
  #   odpt.Railway:JR-East.ChuoSobu                    : 中央・総武線 各駅停車
  #   odpt.Railway:JR-East.ChuoTozai                   : 中央・総武線 各駅停車（東西線直通 中野 - 三鷹）
  #   odpt.Railway:JR-East.SobuTozai                   : 中央・総武線 各駅停車（東西線直通 西船橋 - 津田沼）
  #   odpt.Railway:JR-East.Sobu                        : 総武快速線
  #   odpt.Railway:JR-East.NaritaExpress               : 成田エクスプレス
  #   odpt.Railway:JR-East.Saikyo                      : 埼京線
  #   odpt.Railway:JR-East.Joban                       : 常磐線
  #   odpt.Railway:JR-East.Keiyo                       : 京葉線
  #   odpt.Railway:JR-East.Musashino                   : 武蔵野線
  #   odpt.Railway:JR-East.Shinkansen                  : 東北・秋田・山形・上越・長野新幹線
  #   odpt.Railway:JR-Central.Shinkansen               : 東海道・山陽新幹線
  #   odpt.Railway:Tokyu.Toyoko                        : 東横線
  #   odpt.Railway:Tokyu.Meguro                        : 目黒線
  #   odpt.Railway:Tokyu.DenEnToshi                    : 田園都市線
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : みなとみらい線
  #   odpt.Railway:Odakyu.Odawara                      : 小田原線
  #   odpt.Railway:Odakyu.Tama                         : 多摩線
  #   odpt.Railway:Odakyu.Enoshima                     : 江ノ島線
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : 箱根登山鉄道線（小田原 - 箱根湯本）
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : 箱根登山鉄道線（箱根湯本 - 強羅）
  #   odpt.Railway:Seibu.Ikebukuro                     : 池袋線
  #   odpt.Railway:Seibu.SeibuChichibu                 : 秩父線
  #   odpt.Railway:Seibu.Toshima                       : 豊島線
  #   odpt.Railway:Seibu.Sayama                        : 狭山線
  #   odpt.Railway:Seibu.SeibuYurakucho                : 西武有楽町線
  #   odpt.Railway:Seibu.Shinjuku                      : 新宿線
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : スカイツリーライン（伊勢崎線）
  #   odpt.Railway:Tobu.SkytreeOshiage                 : スカイツリーライン（押上 - 曳舟）
  #   odpt.Railway:Tobu.Skytree                        : スカイツリーライン
  #   odpt.Railway:Tobu.Isesaki                        : 伊勢崎線
  #   odpt.Railway:Tobu.Nikko                          : 日光線
  #   odpt.Railway:Tobu.Kinugawa                       : 鬼怒川線
  #   odpt.Railway:Tobu.Tojo                           : 東上線
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : (nil)
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : (nil)
  #   odpt.Railway:Keio.Keio                           : 京王線
  #   odpt.Railway:Keio.New                            : 新線
  #   odpt.Railway:Keio.Inokashira                     : 井の頭線
  #   odpt.Railway:Keisei.KeiseiMain                   : 本線
  #   odpt.Railway:Keisei.KeiseiOshiage                : 押上線
  #   odpt.Railway:MIR.TX                              : (nil)
  #   odpt.Railway:Yurikamome.Yurikamome               : ゆりかもめ
  #   odpt.Railway:TWR.Rinkai                          : (nil)
  def name_ja_normal
    get_name( name_ja_to_a , allow_nil: true )
  end

  # 路線名（標準・ローマ字表記・路線名のみ）を取得するメソッド
  # @return [String] 路線名（インスタンス変数 name_en）が定義されている場合
  # @return [nil] 路線名（インスタンス変数 name_en）が定義されていない場合
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_en_normal }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : Ginza Line
  #   odpt.Railway:TokyoMetro.Marunouchi               : Marunouchi Line
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : Marunouchi Line (Nakano-sakaue - Honancho)
  #   odpt.Railway:TokyoMetro.Hibiya                   : Hibiya Line
  #   odpt.Railway:TokyoMetro.Tozai                    : Tozai Line
  #   odpt.Railway:TokyoMetro.Chiyoda                  : Chiyoda Line
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : Chiyoda Line (Ayase - Kita-ayase)
  #   odpt.Railway:TokyoMetro.Yurakucho                : Yurakucho Line
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Hanzomon Line
  #   odpt.Railway:TokyoMetro.Namboku                  : Namboku Line
  #   odpt.Railway:TokyoMetro.Fukutoshin               : Fukutoshin Line
  #   odpt.Railway:Toei.Asakusa                        : Asakusa Line
  #   odpt.Railway:Toei.Mita                           : Mita Line
  #   odpt.Railway:Toei.Shinjuku                       : Shinjuku Line
  #   odpt.Railway:Toei.Oedo                           : Oedo Line
  #   odpt.Railway:Toei.NipporiToneri                  : Nippori Toneri Liner
  #   odpt.Railway:Toei.TodenArakawa                   : Arakawa Line
  #   odpt.Railway:JR-East                             : JR Lines
  #   odpt.Railway:JR-East.Yamanote                    : Yamanote Line
  #   odpt.Railway:JR-East.KeihinTohoku                : Keihin-Tohoku Line
  #   odpt.Railway:JR-East.Tokaido                     : Tokaido Line
  #   odpt.Railway:JR-East.Yokosuka                    : Yokosuka Line
  #   odpt.Railway:JR-East.Takasaki                    : Takasaki Line
  #   odpt.Railway:JR-East.Utsunomiya                  : Utsunomiya Line
  #   odpt.Railway:JR-East.ShonanShinjuku              : Shonan-Shinjuku Line
  #   odpt.Railway:JR-East.UenoTokyo                   : Ueno-Tokyo Line
  #   odpt.Railway:JR-East.Chuo                        : Chuo Line (Limited Express)
  #   odpt.Railway:JR-East.ChuoKaisoku                 : Chuo Line (Rapid service)
  #   odpt.Railway:JR-East.ChuoSobu                    : Chuo and Sobu Line (Local service)
  #   odpt.Railway:JR-East.ChuoTozai                   : Chuo and Sobu Line (Local service, between Nakano and Mitaka)
  #   odpt.Railway:JR-East.SobuTozai                   : Chuo and Sobu Line (Local service, between Nishi-funabashi and Tsudanuma)
  #   odpt.Railway:JR-East.Sobu                        : Sobu Line (Rapid service)
  #   odpt.Railway:JR-East.NaritaExpress               : Narita Express
  #   odpt.Railway:JR-East.Saikyo                      : Saikyo Line
  #   odpt.Railway:JR-East.Joban                       : Joban Line
  #   odpt.Railway:JR-East.Keiyo                       : Keiyo Line
  #   odpt.Railway:JR-East.Musashino                   : Musashino Line
  #   odpt.Railway:JR-East.Shinkansen                  : Tohoku, Akita, Yamagata, Joetsu and Nagano Shinkansen
  #   odpt.Railway:JR-Central.Shinkansen               : Tokaido and Sanyo Shinkansen
  #   odpt.Railway:Tokyu.Toyoko                        : Toyoko Line
  #   odpt.Railway:Tokyu.Meguro                        : Meguro Line
  #   odpt.Railway:Tokyu.DenEnToshi                    : Den-en-toshi Line
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : Minatomirai Line
  #   odpt.Railway:Odakyu.Odawara                      : Odawara Line
  #   odpt.Railway:Odakyu.Tama                         : Tama Line
  #   odpt.Railway:Odakyu.Enoshima                     : Enoshima Line
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : Hakone Tozan Line
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : Hakone Tozan Line
  #   odpt.Railway:Seibu.Ikebukuro                     : Ikebukuro Line
  #   odpt.Railway:Seibu.SeibuChichibu                 : Chichibu Line
  #   odpt.Railway:Seibu.Toshima                       : Toshima Line
  #   odpt.Railway:Seibu.Sayama                        : Sayama Line
  #   odpt.Railway:Seibu.SeibuYurakucho                : Seibu Yurakucho Line
  #   odpt.Railway:Seibu.Shinjuku                      : Shinjuku Line
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : Skytree and Isesaki Line
  #   odpt.Railway:Tobu.SkytreeOshiage                 : Skytree Line (Oshiage - Hikifune)
  #   odpt.Railway:Tobu.Skytree                        : Skytree Line
  #   odpt.Railway:Tobu.Isesaki                        : Isesaki Line
  #   odpt.Railway:Tobu.Nikko                          : Nikko Line
  #   odpt.Railway:Tobu.Kinugawa                       : Kinugawa Line
  #   odpt.Railway:Tobu.Tojo                           : Tojo Line
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : (nil)
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : (nil)
  #   odpt.Railway:Keio.Keio                           : Keio Line
  #   odpt.Railway:Keio.New                            : New Line
  #   odpt.Railway:Keio.Inokashira                     : Inokashira Line
  #   odpt.Railway:Keisei.KeiseiMain                   : Main Line
  #   odpt.Railway:Keisei.KeiseiOshiage                : Oshiage Line
  #   odpt.Railway:MIR.TX                              : (nil)
  #   odpt.Railway:Yurikamome.Yurikamome               : Yurikamome
  #   odpt.Railway:TWR.Rinkai                          : (nil)
  def name_en_normal
    get_name( name_en_to_a , allow_nil: true )
  end

  # 標準の路線記号を取得するメソッド
  # @return [::String or nil]
  # @example
  #   ::TokyoMetro::Static.railway_line_infos.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.code_normal }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : G
  #   odpt.Railway:TokyoMetro.Marunouchi               : M
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : m
  #   odpt.Railway:TokyoMetro.Hibiya                   : H
  #   odpt.Railway:TokyoMetro.Tozai                    : T
  #   odpt.Railway:TokyoMetro.Chiyoda                  : C
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : C
  #   odpt.Railway:TokyoMetro.Yurakucho                : Y
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Z
  #   odpt.Railway:TokyoMetro.Namboku                  : N
  #   odpt.Railway:TokyoMetro.Fukutoshin               : F
  #   odpt.Railway:Toei.Asakusa                        : A
  #   odpt.Railway:Toei.Mita                           : I
  #   odpt.Railway:Toei.Shinjuku                       : S
  #   odpt.Railway:Toei.Oedo                           : E
  #   odpt.Railway:Toei.NipporiToneri                  : (nil)
  #   odpt.Railway:Toei.TodenArakawa                   : (nil)
  #   odpt.Railway:JR-East                             : (nil)
  #   odpt.Railway:JR-East.Yamanote                    : (nil)
  #   odpt.Railway:JR-East.KeihinTohoku                : (nil)
  #   odpt.Railway:JR-East.Tokaido                     : (nil)
  #   odpt.Railway:JR-East.Yokosuka                    : (nil)
  #   odpt.Railway:JR-East.Takasaki                    : (nil)
  #   odpt.Railway:JR-East.Utsunomiya                  : (nil)
  #   odpt.Railway:JR-East.ShonanShinjuku              : (nil)
  #   odpt.Railway:JR-East.UenoTokyo                   : (nil)
  #   odpt.Railway:JR-East.Chuo                        : (nil)
  #   odpt.Railway:JR-East.ChuoKaisoku                 : (nil)
  #   odpt.Railway:JR-East.ChuoSobu                    : (nil)
  #   odpt.Railway:JR-East.ChuoTozai                   : (nil)
  #   odpt.Railway:JR-East.SobuTozai                   : (nil)
  #   odpt.Railway:JR-East.Sobu                        : (nil)
  #   odpt.Railway:JR-East.NaritaExpress               : (nil)
  #   odpt.Railway:JR-East.Saikyo                      : (nil)
  #   odpt.Railway:JR-East.Joban                       : (nil)
  #   odpt.Railway:JR-East.Keiyo                       : (nil)
  #   odpt.Railway:JR-East.Musashino                   : (nil)
  #   odpt.Railway:JR-East.Shinkansen                  : (nil)
  #   odpt.Railway:JR-Central.Shinkansen               : (nil)
  #   odpt.Railway:Tokyu.Toyoko                        : TY
  #   odpt.Railway:Tokyu.Meguro                        : MG
  #   odpt.Railway:Tokyu.DenEnToshi                    : DT
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : MM
  #   odpt.Railway:Odakyu.Odawara                      : OH
  #   odpt.Railway:Odakyu.Tama                         : OT
  #   odpt.Railway:Odakyu.Enoshima                     : OE
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : OH
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : OH
  #   odpt.Railway:Seibu.Ikebukuro                     : SI
  #   odpt.Railway:Seibu.SeibuChichibu                 : SI
  #   odpt.Railway:Seibu.Toshima                       : SI
  #   odpt.Railway:Seibu.Sayama                        : SY
  #   odpt.Railway:Seibu.SeibuYurakucho                : SI
  #   odpt.Railway:Seibu.Shinjuku                      : SS
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : TS
  #   odpt.Railway:Tobu.SkytreeOshiage                 : TS
  #   odpt.Railway:Tobu.Skytree                        : TS
  #   odpt.Railway:Tobu.Isesaki                        : TI
  #   odpt.Railway:Tobu.Nikko                          : TN
  #   odpt.Railway:Tobu.Kinugawa                       : TN
  #   odpt.Railway:Tobu.Tojo                           : TJ
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : (nil)
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : TR
  #   odpt.Railway:Keio.Keio                           : KO
  #   odpt.Railway:Keio.New                            : KO
  #   odpt.Railway:Keio.Inokashira                     : IK
  #   odpt.Railway:Keisei.KeiseiMain                   : KS
  #   odpt.Railway:Keisei.KeiseiOshiage                : KS
  #   odpt.Railway:MIR.TX                              : (nil)
  #   odpt.Railway:Yurikamome.Yurikamome               : U
  #   odpt.Railway:TWR.Rinkai                          : (nil)
  def code_normal
    if has_code_infos?
      codes_to_a.first
    else
      nil
    end
  end

  # @!group 路線名に関するメソッド (3) - 標準（【原則】事業者名 + 路線名）

  # 路線名（標準・日本語表記・【原則】事業者名あり）を取得するメソッド
  # @note 事業者名が「東京メトロ」の場合は事業者名を省略する。
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_ja_with_operator_name }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : 銀座線
  #   odpt.Railway:TokyoMetro.Marunouchi               : 丸ノ内線
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : 丸ノ内線（中野坂上 - 方南町）
  #   odpt.Railway:TokyoMetro.Hibiya                   : 日比谷線
  #   odpt.Railway:TokyoMetro.Tozai                    : 東西線
  #   odpt.Railway:TokyoMetro.Chiyoda                  : 千代田線
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : 千代田線（綾瀬 - 北綾瀬）
  #   odpt.Railway:TokyoMetro.Yurakucho                : 有楽町線
  #   odpt.Railway:TokyoMetro.Hanzomon                 : 半蔵門線
  #   odpt.Railway:TokyoMetro.Namboku                  : 南北線
  #   odpt.Railway:TokyoMetro.Fukutoshin               : 副都心線
  #   odpt.Railway:Toei.Asakusa                        : 都営浅草線
  #   odpt.Railway:Toei.Mita                           : 都営三田線
  #   odpt.Railway:Toei.Shinjuku                       : 都営新宿線
  #   odpt.Railway:Toei.Oedo                           : 都営大江戸線
  #   odpt.Railway:Toei.NipporiToneri                  : 日暮里・舎人ライナー
  #   odpt.Railway:Toei.TodenArakawa                   : 都電荒川線
  #   odpt.Railway:JR-East                             : JR各線
  #   odpt.Railway:JR-East.Yamanote                    : JR山手線
  #   odpt.Railway:JR-East.KeihinTohoku                : JR京浜東北線
  #   odpt.Railway:JR-East.Tokaido                     : JR東海道線
  #   odpt.Railway:JR-East.Yokosuka                    : JR横須賀線
  #   odpt.Railway:JR-East.Takasaki                    : JR高崎線
  #   odpt.Railway:JR-East.Utsunomiya                  : JR宇都宮線
  #   odpt.Railway:JR-East.ShonanShinjuku              : JR湘南新宿ライン
  #   odpt.Railway:JR-East.UenoTokyo                   : JR上野東京ライン
  #   odpt.Railway:JR-East.Chuo                        : JR中央線 特急
  #   odpt.Railway:JR-East.ChuoKaisoku                 : JR中央線 快速
  #   odpt.Railway:JR-East.ChuoSobu                    : JR中央・総武線 各駅停車
  #   odpt.Railway:JR-East.ChuoTozai                   : JR中央・総武線 各駅停車（東西線直通 中野 - 三鷹）
  #   odpt.Railway:JR-East.SobuTozai                   : JR中央・総武線 各駅停車（東西線直通 西船橋 - 津田沼）
  #   odpt.Railway:JR-East.Sobu                        : JR総武快速線
  #   odpt.Railway:JR-East.NaritaExpress               : JR成田エクスプレス
  #   odpt.Railway:JR-East.Saikyo                      : JR埼京線
  #   odpt.Railway:JR-East.Joban                       : JR常磐線
  #   odpt.Railway:JR-East.Keiyo                       : JR京葉線
  #   odpt.Railway:JR-East.Musashino                   : JR武蔵野線
  #   odpt.Railway:JR-East.Shinkansen                  : 東北・秋田・山形・上越・長野新幹線
  #   odpt.Railway:JR-Central.Shinkansen               : 東海道・山陽新幹線
  #   odpt.Railway:Tokyu.Toyoko                        : 東急東横線
  #   odpt.Railway:Tokyu.Meguro                        : 東急目黒線
  #   odpt.Railway:Tokyu.DenEnToshi                    : 東急田園都市線
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : 横浜高速鉄道みなとみらい線
  #   odpt.Railway:Odakyu.Odawara                      : 小田急小田原線
  #   odpt.Railway:Odakyu.Tama                         : 小田急多摩線
  #   odpt.Railway:Odakyu.Enoshima                     : 小田急江ノ島線
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : 箱根登山鉄道線（小田原 - 箱根湯本）
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : 箱根登山鉄道線（箱根湯本 - 強羅）
  #   odpt.Railway:Seibu.Ikebukuro                     : 西武池袋線
  #   odpt.Railway:Seibu.SeibuChichibu                 : 西武秩父線
  #   odpt.Railway:Seibu.Toshima                       : 西武豊島線
  #   odpt.Railway:Seibu.Sayama                        : 西武狭山線
  #   odpt.Railway:Seibu.SeibuYurakucho                : 西武有楽町線
  #   odpt.Railway:Seibu.Shinjuku                      : 西武新宿線
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : 東武スカイツリーライン（伊勢崎線）
  #   odpt.Railway:Tobu.SkytreeOshiage                 : 東武スカイツリーライン（押上 - 曳舟）
  #   odpt.Railway:Tobu.Skytree                        : 東武スカイツリーライン
  #   odpt.Railway:Tobu.Isesaki                        : 東武伊勢崎線
  #   odpt.Railway:Tobu.Nikko                          : 東武日光線
  #   odpt.Railway:Tobu.Kinugawa                       : 東武鬼怒川線
  #   odpt.Railway:Tobu.Tojo                           : 東武東上線
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : 埼玉高速鉄道
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : 東葉高速鉄道
  #   odpt.Railway:Keio.Keio                           : 京王線
  #   odpt.Railway:Keio.New                            : 京王新線
  #   odpt.Railway:Keio.Inokashira                     : 京王井の頭線
  #   odpt.Railway:Keisei.KeiseiMain                   : 京成本線
  #   odpt.Railway:Keisei.KeiseiOshiage                : 京成押上線
  #   odpt.Railway:MIR.TX                              : つくばエクスプレス
  #   odpt.Railway:Yurikamome.Yurikamome               : ゆりかもめ
  #   odpt.Railway:TWR.Rinkai                          : りんかい線
  def name_ja_with_operator_name
    name_with_operator_name_sub( operator_info.name_ja_normal , name_ja_normal , en: false , with_operator: with_operator_name? )
  end

  # 路線名（標準・ローマ字表記・【原則】事業者名あり）を取得するメソッド
  # @note ローマ字表記の事業者名が "Tokyo Metro" の場合は事業者名を省略する。
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_en_with_operator_name }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : Ginza Line
  #   odpt.Railway:TokyoMetro.Marunouchi               : Marunouchi Line
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : Marunouchi Line (Nakano-sakaue - Honancho)
  #   odpt.Railway:TokyoMetro.Hibiya                   : Hibiya Line
  #   odpt.Railway:TokyoMetro.Tozai                    : Tozai Line
  #   odpt.Railway:TokyoMetro.Chiyoda                  : Chiyoda Line
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : Chiyoda Line (Ayase - Kita-ayase)
  #   odpt.Railway:TokyoMetro.Yurakucho                : Yurakucho Line
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Hanzomon Line
  #   odpt.Railway:TokyoMetro.Namboku                  : Namboku Line
  #   odpt.Railway:TokyoMetro.Fukutoshin               : Fukutoshin Line
  #   odpt.Railway:Toei.Asakusa                        : Toei Asakusa Line
  #   odpt.Railway:Toei.Mita                           : Toei Mita Line
  #   odpt.Railway:Toei.Shinjuku                       : Toei Shinjuku Line
  #   odpt.Railway:Toei.Oedo                           : Toei Oedo Line
  #   odpt.Railway:Toei.NipporiToneri                  : Nippori Toneri Liner
  #   odpt.Railway:Toei.TodenArakawa                   : Toden Arakawa Line
  #   odpt.Railway:JR-East                             : JR Lines
  #   odpt.Railway:JR-East.Yamanote                    : JR Yamanote Line
  #   odpt.Railway:JR-East.KeihinTohoku                : JR Keihin-Tohoku Line
  #   odpt.Railway:JR-East.Tokaido                     : JR Tokaido Line
  #   odpt.Railway:JR-East.Yokosuka                    : JR Yokosuka Line
  #   odpt.Railway:JR-East.Takasaki                    : JR Takasaki Line
  #   odpt.Railway:JR-East.Utsunomiya                  : JR Utsunomiya Line
  #   odpt.Railway:JR-East.ShonanShinjuku              : JR Shonan-Shinjuku Line
  #   odpt.Railway:JR-East.UenoTokyo                   : JR Ueno-Tokyo Line
  #   odpt.Railway:JR-East.Chuo                        : JR Chuo Line (Limited Express)
  #   odpt.Railway:JR-East.ChuoKaisoku                 : JR Chuo Line (Rapid service)
  #   odpt.Railway:JR-East.ChuoSobu                    : JR Chuo and Sobu Line (Local service)
  #   odpt.Railway:JR-East.ChuoTozai                   : JR Chuo and Sobu Line (Local service, between Nakano and Mitaka)
  #   odpt.Railway:JR-East.SobuTozai                   : JR Chuo and Sobu Line (Local service, between Nishi-funabashi and Tsudanuma)
  #   odpt.Railway:JR-East.Sobu                        : JR Sobu Line (Rapid service)
  #   odpt.Railway:JR-East.NaritaExpress               : JR Narita Express
  #   odpt.Railway:JR-East.Saikyo                      : JR Saikyo Line
  #   odpt.Railway:JR-East.Joban                       : JR Joban Line
  #   odpt.Railway:JR-East.Keiyo                       : JR Keiyo Line
  #   odpt.Railway:JR-East.Musashino                   : JR Musashino Line
  #   odpt.Railway:JR-East.Shinkansen                  : Tohoku, Akita, Yamagata, Joetsu and Nagano Shinkansen
  #   odpt.Railway:JR-Central.Shinkansen               : Tokaido and Sanyo Shinkansen
  #   odpt.Railway:Tokyu.Toyoko                        : Tokyu Toyoko Line
  #   odpt.Railway:Tokyu.Meguro                        : Tokyu Meguro Line
  #   odpt.Railway:Tokyu.DenEnToshi                    : Tokyu Den-en-toshi Line
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : Yokohama Minatomirai Railway Company Minatomirai Line
  #   odpt.Railway:Odakyu.Odawara                      : Odakyu Odawara Line
  #   odpt.Railway:Odakyu.Tama                         : Odakyu Tama Line
  #   odpt.Railway:Odakyu.Enoshima                     : Odakyu Enoshima Line
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : Hakone Tozan Line
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : Hakone Tozan Line
  #   odpt.Railway:Seibu.Ikebukuro                     : Seibu Ikebukuro Line
  #   odpt.Railway:Seibu.SeibuChichibu                 : Seibu Chichibu Line
  #   odpt.Railway:Seibu.Toshima                       : Seibu Toshima Line
  #   odpt.Railway:Seibu.Sayama                        : Seibu Sayama Line
  #   odpt.Railway:Seibu.SeibuYurakucho                : Seibu Yurakucho Line
  #   odpt.Railway:Seibu.Shinjuku                      : Seibu Shinjuku Line
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : Tobu Skytree and Isesaki Line
  #   odpt.Railway:Tobu.SkytreeOshiage                 : Tobu Skytree Line (Oshiage - Hikifune)
  #   odpt.Railway:Tobu.Skytree                        : Tobu Skytree Line
  #   odpt.Railway:Tobu.Isesaki                        : Tobu Isesaki Line
  #   odpt.Railway:Tobu.Nikko                          : Tobu Nikko Line
  #   odpt.Railway:Tobu.Kinugawa                       : Tobu Kinugawa Line
  #   odpt.Railway:Tobu.Tojo                           : Tobu Tojo Line
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : Saitama Railway
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : Toyo Rapid Railway
  #   odpt.Railway:Keio.Keio                           : Keio Line
  #   odpt.Railway:Keio.New                            : Keio New Line
  #   odpt.Railway:Keio.Inokashira                     : Keio Inokashira Line
  #   odpt.Railway:Keisei.KeiseiMain                   : Keisei Main Line
  #   odpt.Railway:Keisei.KeiseiOshiage                : Keisei Oshiage Line
  #   odpt.Railway:MIR.TX                              : Tsukuba Express
  #   odpt.Railway:Yurikamome.Yurikamome               : Yurikamome
  #   odpt.Railway:TWR.Rinkai                          : Rinkai Line
  def name_en_with_operator_name
    name_with_operator_name_sub( operator_info.name_en_normal , name_en_normal , en: true , with_operator: with_operator_name? )
  end

  # @!group 路線名に関するメソッド (4) - 表示用（事業者名 + 路線名）

  # 路線名（標準・日本語表記・事業者名あり）を取得するメソッド
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_ja_with_operator_name_precise }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : 東京メトロ銀座線
  #   odpt.Railway:TokyoMetro.Marunouchi               : 東京メトロ丸ノ内線
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : 東京メトロ丸ノ内線（中野坂上 - 方南町）
  #   odpt.Railway:TokyoMetro.Hibiya                   : 東京メトロ日比谷線
  #   odpt.Railway:TokyoMetro.Tozai                    : 東京メトロ東西線
  #   odpt.Railway:TokyoMetro.Chiyoda                  : 東京メトロ千代田線
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : 東京メトロ千代田線（綾瀬 - 北綾瀬）
  #   odpt.Railway:TokyoMetro.Yurakucho                : 東京メトロ有楽町線
  #   odpt.Railway:TokyoMetro.Hanzomon                 : 東京メトロ半蔵門線
  #   odpt.Railway:TokyoMetro.Namboku                  : 東京メトロ南北線
  #   odpt.Railway:TokyoMetro.Fukutoshin               : 東京メトロ副都心線
  #   odpt.Railway:Toei.Asakusa                        : 都営浅草線
  #   odpt.Railway:Toei.Mita                           : 都営三田線
  #   odpt.Railway:Toei.Shinjuku                       : 都営新宿線
  #   odpt.Railway:Toei.Oedo                           : 都営大江戸線
  #   odpt.Railway:Toei.NipporiToneri                  : 都営日暮里・舎人ライナー
  #   odpt.Railway:Toei.TodenArakawa                   : 都電荒川線
  #   odpt.Railway:JR-East                             : JR各線
  #   odpt.Railway:JR-East.Yamanote                    : JR山手線
  #   odpt.Railway:JR-East.KeihinTohoku                : JR京浜東北線
  #   odpt.Railway:JR-East.Tokaido                     : JR東海道線
  #   odpt.Railway:JR-East.Yokosuka                    : JR横須賀線
  #   odpt.Railway:JR-East.Takasaki                    : JR高崎線
  #   odpt.Railway:JR-East.Utsunomiya                  : JR宇都宮線
  #   odpt.Railway:JR-East.ShonanShinjuku              : JR湘南新宿ライン
  #   odpt.Railway:JR-East.UenoTokyo                   : JR上野東京ライン
  #   odpt.Railway:JR-East.Chuo                        : JR中央線 特急
  #   odpt.Railway:JR-East.ChuoKaisoku                 : JR中央線 快速
  #   odpt.Railway:JR-East.ChuoSobu                    : JR中央・総武線 各駅停車
  #   odpt.Railway:JR-East.ChuoTozai                   : JR中央・総武線 各駅停車（東西線直通 中野 - 三鷹）
  #   odpt.Railway:JR-East.SobuTozai                   : JR中央・総武線 各駅停車（東西線直通 西船橋 - 津田沼）
  #   odpt.Railway:JR-East.Sobu                        : JR総武快速線
  #   odpt.Railway:JR-East.NaritaExpress               : JR成田エクスプレス
  #   odpt.Railway:JR-East.Saikyo                      : JR埼京線
  #   odpt.Railway:JR-East.Joban                       : JR常磐線
  #   odpt.Railway:JR-East.Keiyo                       : JR京葉線
  #   odpt.Railway:JR-East.Musashino                   : JR武蔵野線
  #   odpt.Railway:JR-East.Shinkansen                  : JR東北・秋田・山形・上越・長野新幹線
  #   odpt.Railway:JR-Central.Shinkansen               : JR東海道・山陽新幹線
  #   odpt.Railway:Tokyu.Toyoko                        : 東急東横線
  #   odpt.Railway:Tokyu.Meguro                        : 東急目黒線
  #   odpt.Railway:Tokyu.DenEnToshi                    : 東急田園都市線
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : 横浜高速鉄道みなとみらい線
  #   odpt.Railway:Odakyu.Odawara                      : 小田急小田原線
  #   odpt.Railway:Odakyu.Tama                         : 小田急多摩線
  #   odpt.Railway:Odakyu.Enoshima                     : 小田急江ノ島線
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : 箱根登山鉄道線（小田原 - 箱根湯本）
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : 箱根登山鉄道線（箱根湯本 - 強羅）
  #   odpt.Railway:Seibu.Ikebukuro                     : 西武池袋線
  #   odpt.Railway:Seibu.SeibuChichibu                 : 西武秩父線
  #   odpt.Railway:Seibu.Toshima                       : 西武豊島線
  #   odpt.Railway:Seibu.Sayama                        : 西武狭山線
  #   odpt.Railway:Seibu.SeibuYurakucho                : 西武有楽町線
  #   odpt.Railway:Seibu.Shinjuku                      : 西武新宿線
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : 東武スカイツリーライン（伊勢崎線）
  #   odpt.Railway:Tobu.SkytreeOshiage                 : 東武スカイツリーライン（押上 - 曳舟）
  #   odpt.Railway:Tobu.Skytree                        : 東武スカイツリーライン
  #   odpt.Railway:Tobu.Isesaki                        : 東武伊勢崎線
  #   odpt.Railway:Tobu.Nikko                          : 東武日光線
  #   odpt.Railway:Tobu.Kinugawa                       : 東武鬼怒川線
  #   odpt.Railway:Tobu.Tojo                           : 東武東上線
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : 埼玉高速鉄道
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : 東葉高速鉄道
  #   odpt.Railway:Keio.Keio                           : 京王線
  #   odpt.Railway:Keio.New                            : 京王新線
  #   odpt.Railway:Keio.Inokashira                     : 京王井の頭線
  #   odpt.Railway:Keisei.KeiseiMain                   : 京成本線
  #   odpt.Railway:Keisei.KeiseiOshiage                : 京成押上線
  #   odpt.Railway:MIR.TX                              : つくばエクスプレス
  #   odpt.Railway:Yurikamome.Yurikamome               : ゆりかもめ
  #   odpt.Railway:TWR.Rinkai                          : りんかい線
  def name_ja_with_operator_name_precise( without_parentheses: false )
    str = name_with_operator_name_sub( operator_info.name_ja_normal , name_ja_normal , en: false )

    unless str.string?
      err_msg_ary = ::Array.new

      err_msg_ary << "Error: "
      err_msg_ary << "  \[ name_ja_normal \] #{ name_ja_normal } (class: #{ name_ja_normal.class.name })"
      err_msg_ary << "  \[ operator_info.name_ja_normal \] #{ operator_info.name_ja_normal } (class: #{ operator_info.name_ja_normal.class.name })"
      raise err_msg_ary.join( "\n" )
    end

    if without_parentheses
      str = str.gsub( /（.+）\Z/ , "" )
    end

    return str
  end

  # 路線名（標準・ローマ字表記・事業者名あり）を取得するメソッド
  # @return [String]
  # @example
  #   ::TokyoMetro::Static.railway_lines.each_value { | railway_line | puts railway_line.same_as.ljust(48) + " : " + railway_line.name_en_with_operator_name_precise }
  #   =>
  #   odpt.Railway:TokyoMetro.Ginza                    : Tokyo Metro Ginza Line
  #   odpt.Railway:TokyoMetro.Marunouchi               : Tokyo Metro Marunouchi Line
  #   odpt.Railway:TokyoMetro.MarunouchiBranch         : Tokyo Metro Marunouchi Line (Nakano-sakaue - Honancho)
  #   odpt.Railway:TokyoMetro.Hibiya                   : Tokyo Metro Hibiya Line
  #   odpt.Railway:TokyoMetro.Tozai                    : Tokyo Metro Tozai Line
  #   odpt.Railway:TokyoMetro.Chiyoda                  : Tokyo Metro Chiyoda Line
  #   odpt.Railway:TokyoMetro.ChiyodaBranch            : Tokyo Metro Chiyoda Line (Ayase - Kita-ayase)
  #   odpt.Railway:TokyoMetro.Yurakucho                : Tokyo Metro Yurakucho Line
  #   odpt.Railway:TokyoMetro.Hanzomon                 : Tokyo Metro Hanzomon Line
  #   odpt.Railway:TokyoMetro.Namboku                  : Tokyo Metro Namboku Line
  #   odpt.Railway:TokyoMetro.Fukutoshin               : Tokyo Metro Fukutoshin Line
  #   odpt.Railway:Toei.Asakusa                        : Toei Asakusa Line
  #   odpt.Railway:Toei.Mita                           : Toei Mita Line
  #   odpt.Railway:Toei.Shinjuku                       : Toei Shinjuku Line
  #   odpt.Railway:Toei.Oedo                           : Toei Oedo Line
  #   odpt.Railway:Toei.NipporiToneri                  : Toei Nippori Toneri Liner
  #   odpt.Railway:Toei.TodenArakawa                   : Toden Arakawa Line
  #   odpt.Railway:JR-East                             : JR Lines
  #   odpt.Railway:JR-East.Yamanote                    : JR Yamanote Line
  #   odpt.Railway:JR-East.KeihinTohoku                : JR Keihin-Tohoku Line
  #   odpt.Railway:JR-East.Tokaido                     : JR Tokaido Line
  #   odpt.Railway:JR-East.Yokosuka                    : JR Yokosuka Line
  #   odpt.Railway:JR-East.Takasaki                    : JR Takasaki Line
  #   odpt.Railway:JR-East.Utsunomiya                  : JR Utsunomiya Line
  #   odpt.Railway:JR-East.ShonanShinjuku              : JR Shonan-Shinjuku Line
  #   odpt.Railway:JR-East.UenoTokyo                   : JR Ueno-Tokyo Line
  #   odpt.Railway:JR-East.Chuo                        : JR Chuo Line (Limited Express)
  #   odpt.Railway:JR-East.ChuoKaisoku                 : JR Chuo Line (Rapid service)
  #   odpt.Railway:JR-East.ChuoSobu                    : JR Chuo and Sobu Line (Local service)
  #   odpt.Railway:JR-East.ChuoTozai                   : JR Chuo and Sobu Line (Local service, between Nakano and Mitaka)
  #   odpt.Railway:JR-East.SobuTozai                   : JR Chuo and Sobu Line (Local service, between Nishi-funabashi and Tsudanuma)
  #   odpt.Railway:JR-East.Sobu                        : JR Sobu Line (Rapid service)
  #   odpt.Railway:JR-East.NaritaExpress               : JR Narita Express
  #   odpt.Railway:JR-East.Saikyo                      : JR Saikyo Line
  #   odpt.Railway:JR-East.Joban                       : JR Joban Line
  #   odpt.Railway:JR-East.Keiyo                       : JR Keiyo Line
  #   odpt.Railway:JR-East.Musashino                   : JR Musashino Line
  #   odpt.Railway:JR-East.Shinkansen                  : Tohoku, Akita, Yamagata, Joetsu and Nagano Shinkansen
  #   odpt.Railway:JR-Central.Shinkansen               : Tokaido and Sanyo Shinkansen
  #   odpt.Railway:Tokyu.Toyoko                        : Tokyu Toyoko Line
  #   odpt.Railway:Tokyu.Meguro                        : Tokyu Meguro Line
  #   odpt.Railway:Tokyu.DenEnToshi                    : Tokyu Den-en-toshi Line
  #   odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai : Yokohama Minatomirai Railway Company Minatomirai Line
  #   odpt.Railway:Odakyu.Odawara                      : Odakyu Odawara Line
  #   odpt.Railway:Odakyu.Tama                         : Odakyu Tama Line
  #   odpt.Railway:Odakyu.Enoshima                     : Odakyu Enoshima Line
  #   odpt.Railway:HakoneTozan.Rail.OdawaraSide        : Hakone Tozan Line
  #   odpt.Railway:HakoneTozan.Rail.GoraSide           : Hakone Tozan Line
  #   odpt.Railway:Seibu.Ikebukuro                     : Seibu Ikebukuro Line
  #   odpt.Railway:Seibu.SeibuChichibu                 : Seibu Chichibu Line
  #   odpt.Railway:Seibu.Toshima                       : Seibu Toshima Line
  #   odpt.Railway:Seibu.Sayama                        : Seibu Sayama Line
  #   odpt.Railway:Seibu.SeibuYurakucho                : Seibu Yurakucho Line
  #   odpt.Railway:Seibu.Shinjuku                      : Seibu Shinjuku Line
  #   odpt.Railway:Tobu.SkytreeIsesaki                 : Tobu Skytree and Isesaki Line
  #   odpt.Railway:Tobu.SkytreeOshiage                 : Tobu Skytree Line (Oshiage - Hikifune)
  #   odpt.Railway:Tobu.Skytree                        : Tobu Skytree Line
  #   odpt.Railway:Tobu.Isesaki                        : Tobu Isesaki Line
  #   odpt.Railway:Tobu.Nikko                          : Tobu Nikko Line
  #   odpt.Railway:Tobu.Kinugawa                       : Tobu Kinugawa Line
  #   odpt.Railway:Tobu.Tojo                           : Tobu Tojo Line
  #   odpt.Railway:SaitamaRailway.SaitamaRailway       : Saitama Railway
  #   odpt.Railway:ToyoRapidRailway.ToyoRapidRailway   : Toyo Rapid Railway
  #   odpt.Railway:Keio.Keio                           : Keio Line
  #   odpt.Railway:Keio.New                            : Keio New Line
  #   odpt.Railway:Keio.Inokashira                     : Keio Inokashira Line
  #   odpt.Railway:Keisei.KeiseiMain                   : Keisei Main Line
  #   odpt.Railway:Keisei.KeiseiOshiage                : Keisei Oshiage Line
  #   odpt.Railway:MIR.TX                              : Tsukuba Express
  #   odpt.Railway:Yurikamome.Yurikamome               : Yurikamome
  #   odpt.Railway:TWR.Rinkai                          : Rinkai Line
  def name_en_with_operator_name_precise
    str = name_with_operator_name_sub( operator_info.name_en_normal , name_en_normal , en: true )

    if str.string?
      return str
    else
      ary = ::Array.new
      ary << "Error:"
      ary << "  \[ name_en_normal \] #{ name_en_normal } (class: #{ name_en_normal.class.name })"
      ary << "  \[ operator_info.name_en_normal \] #{ operator_info.name_en_normal } (class: #{ operator_info.name_en_normal.class.name })"
      raise atr.join( "\n" )
    end
  end

  # @!group 路線名に関するメソッド (5) - 表示用（事業者名 + 路線名）【特殊な路線を処理】

  def name_ja_to_display( process_special_railway_line: true )
    if process_special_railway_line
      if seibu_yurakucho_line?
        "西武線"
      else
        name_ja_with_operator_name
      end
    else
      name_ja_with_operator_name
    end
  end

  def name_en_to_display( process_special_railway_line: true )
    if process_special_railway_line
      if seibu_yurakucho_line?
        "Seibu Line"
      else
        name_en_with_operator_name
      end
    else
      name_en_with_operator_name
    end
  end

  # @!group 路線記号

  def with_bold_railway_line_code_text?
    operated_by_tokyu? or operated_by_yokohama_minatomirai_railway? or operated_by_toyo_rapid_railway? or ( code_normal.present? and code_normal.length == 1 )
  end

  # @!group 支線

  def is_not_branch_railway_line_info?
    !( is_branch_railway_line_info? )
  end

  # @!endgroup

  private

  def with_operator_name?
    !( this_operator? or nippori_toneri_liner? or shinkansen? )
  end

  def name_with_operator_name_sub( operator_name , railway_line_name , en: false , with_operator: true )
    # 路線名が定義されていない場合
    if railway_line_name.nil?
      # 事業者名を返す
      return operator_name
    end

    # 事業者名なしの設定がされている場合
    unless with_operator
      return railway_line_name
    end

    # 路線名・事業者名がともに定義されている場合
    if railway_line_name.string? and operator_name.string?
      # 路線名の先頭に事業者名が付いている場合（京王線、西武有楽町線などを想定）
      # または「設定がローマ字 かつ 路線が新幹線」の場合
      if ( !(en) and /\A#{ operator_name }/ === railway_line_name ) or ( en and ( /\A#{ operator_name }/ === railway_line_name or /Shinkansen\Z/ === railway_line_name or operator_name.blank? ) )
        # 路線名を返す
         return railway_line_name
      # 路線名の先頭に事業者名が付いていない場合
      else
        # 事業者名と路線名を繋げた文字列を返す
        if en
          return "#{ operator_name } #{ railway_line_name }"
        else
          return operator_name + railway_line_name
        end
      end
    end

    return nil
  end

end
