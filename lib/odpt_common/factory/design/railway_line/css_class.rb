class OdptCommon::Factory::Design::RailwayLine::CssClass < OdptCommon::Factory::Design::Fundamental::CssClass

  def initialize( object )
    super( object , :name_en_with_operator_name )
  end

  def to_s
    if @object.tokyo_metro_marunouchi_branch_line?
      str = "tokyo_metro_marunouchi_branch"
    elsif @object.tokyo_metro_chiyoda_branch_line?
      str = "tokyo_metro_chiyoda_branch"
    elsif @object.shinkansen_of_jr_east?
      str = "shinkansen_e"
    elsif @object.shinkansen_of_jr_central?
      str = "shinkansen_c"
    elsif @object.minatomirai_line?
      str = "yokohama_minatomirai_mm"
    elsif @object.keio_line?
      str = "keio_line"
    elsif @object.yurikamome_line?
      str = "yurikamome_line"
    else
      str = super()
    end
    return str
  end

end
