module OdptCommon::Modules::Decision::Common::RailwayLine::Name

  def on_tokyo_metro_marunouchi_branch_line?
    on_the_railway_line_of?( "odpt.Railway:TokyoMetro.MarunouchiBranch" )
  end

  def on_tokyo_metro_chiyoda_branch_line?
    on_the_railway_line_of?( "odpt.Railway:TokyoMetro.ChiyodaBranch" )
  end

  def on_toei_mita_line?
    on_the_railway_line_of?( "odpt.Railway:Toei.Mita" )
  end

  def on_toden_arakawa_line?
    on_the_railway_line_of?( "odpt.Railway:Toei.TodenArakawa" )
  end

  def on_jr_lines?
    on_the_railway_line_of?( "odpt.Railway:JR-East" )
  end

  def on_shinkansen_of_jr_east?
    on_the_railway_line_of?( "odpt.Railway:JR-East.Shinkansen" , "odpt.Railway:JR-East.Shinkansen.2015" , "odpt.Railway:JR-East.Shinkansen.2016" )
  end

  def on_shinkansen_of_jr_central?
    on_the_railway_line_of?( "odpt.Railway:JR-Central.Shinkansen" )
  end

  def on_minatomirai_line?
    on_the_railway_line_of?( "odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai" )
  end

  def odakyu_line?
    on_the_railway_line_of?( "odpt.Railway:Odakyu" )
  end

  def on_tobu_skytree_line?
    on_the_railway_line_of?( "odpt.Railway:Tobu.SkytreeIsesaki" , "odpt.Railway:Tobu.SkytreeOshiage" , "odpt.Railway:Tobu.Skytree" )
  end

  def on_tobu_skytree_isesaki_line_through_to_hanzomon_line?
    on_the_railway_line_of?( "odpt.Railway:Tobu.Isesaki.Hanzomon" )
  end

  def on_tobu_skytree_nikko_line_through_to_hanzomon_line?
    on_the_railway_line_of?( "odpt.Railway:Tobu.Nikko.Hanzomon" )
  end

  def on_tobu_skytree_nikko_line_through_to_hibiya_line?
    on_the_railway_line_of?( "odpt.Railway:Tobu.Nikko.Hibiya" )
  end

  def on_tobu_skytree_line_with_through_operation_infos?
    on_the_railway_line_of?( "odpt.Railway:Tobu.Isesaki.Hanzomon" , "odpt.Railway:Tobu.Nikko.Hanzomon" , "odpt.Railway:Tobu.Nikko.Hibiya" )
  end

  def on_seibu_yurakucho_line?
    on_the_railway_line_of?( "odpt.Railway:Seibu.SeibuYurakucho" )
  end

  def on_keio_line?
    on_the_railway_line_of?( "odpt.Railway:Keio.Keio" )
  end

  def on_yurikamome_line?
    on_the_railway_line_of?( "odpt.Railway:Yurikamome.Yurikamome" )
  end

  # @!group 複数の路線

  def on_shinkansen?
    on_shinkansen_of_jr_east? or on_shinkansen_of_jr_central?
  end

  # @!endgroup

  #-------- [alias]
  [
    :tokyo_metro_marunouchi_branch_line ,
    :tokyo_metro_chiyoda_branch_line ,
    :toei_mita_line ,
    :toden_arakawa_line ,
    :jr_lines ,
    :shinkansen_of_jr_east ,
    :shinkansen_of_jr_central ,
    :minatomirai_line ,
    :tobu_skytree_line ,
    :seibu_yurakucho_line ,
    :keio_line ,
    :yurikamome_line ,
    :shinkansen
  ].each do | method_base_name |
    eval <<-ALIAS
      alias :#{method_base_name}? :on_#{method_base_name}?
      alias :is_on_#{method_base_name}? :on_#{method_base_name}?
      alias :is_#{method_base_name}? :on_#{method_base_name}?
    ALIAS
  end

  private

  def on_the_railway_line_of?( *args , compared: railway_line.same_as )
    compare_base( args , compared )
  end

end
