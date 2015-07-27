module OdptCommon::Modules::Name::Common::RailwayLine::StationAttribute

  # @!group 「駅」の属性（路面電車については「停留場」）

  def station_attribute_ja
    if has_teiryujous?
      "停留場"
    else
      "駅"
    end
  end

  def station_attribute_hira
    if has_teiryujous?
      "ていりゅうじょう"
    else
      "えき"
    end
  end

  def station_attribute_en
    "station"
  end

  def station_attribute_en_short
    "sta."
  end

  private

  def has_teiryujous?
    on_toden_arakawa_line?
  end

end
