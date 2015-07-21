module OdptCommon::Modules::Decision::Common::RailwayLine::Name

  def tokyo_metro_marunouchi_branch_line?
    on_the_railway_line_of?( "odpt.Railway:TokyoMetro.MarunouchiBranch" )
  end

  def tokyo_metro_chiyoda_branch_line?
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

  def shinkansen_of_jr_east?
    on_the_railway_line_of?( "odpt.Railway:JR-East.Shinkansen" , "odpt.Railway:JR-East.Shinkansen.2015" , "odpt.Railway:JR-East.Shinkansen.2016" )
  end

  def shinkansen_of_jr_central?
    on_the_railway_line_of?( "odpt.Railway:JR-Central.Shinkansen" )
  end

  def minatomirai_line?
    on_the_railway_line_of?( "odpt.Railway:YokohamaMinatomiraiRailway.Minatomirai" )
  end

  def tobu_sky_tree_isesaki_line?
    on_the_railway_line_of?( "odpt.Railway:Tobu.SkyTreeIsesaki" )
  end

  def seibu_yurakucho_line?
    on_the_railway_line_of?( "odpt.Railway:Seibu.SeibuYurakucho" )
  end

  def keio_line?
    on_the_railway_line_of?( "odpt.Railway:Keio.Keio" )
  end

  def yurikamome_line?
    on_the_railway_line_of?( "odpt.Railway:Yurikamome.Yurikamome" )
  end

  # @!group 複数の路線

  def on_shinkansen?
    shinkansen_of_jr_east? or shinkansen_of_jr_central?
  end

  # @!endgroup

  private

  def on_the_railway_line_of?( *args , compared: railway_line.same_as )
    compare_base( args , compared )
  end

end
