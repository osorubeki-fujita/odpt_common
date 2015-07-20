class OdptCommon::Factory::Design::RailwayLine::CssClass < OdptCommon::Factory::Design::Fundamental::CssClass

  def initialize( object )
    super( object , :name_en_with_operator_name )
  end

  def to_s
    if @object.marunouchi_branch_line?
      "tokyo_metro_marunouchi_branch"
    elsif @object.chiyoda_branch_line?
      "tokyo_metro_chiyoda_branch"
    elsif @object.shinkansen_of_jr_east?
      "shinkansen_e"
    elsif @object.shinkansen_of_jr_central?
      "shinkansen_c"
    elsif @object.minatomirai_line?
      "yokohama_minatomirai_mm"
    elsif @object.keio_line?
      "keio_line"
    elsif @object.yurikamome_line?
      "yurikamome_line"
    else
      super()
    end
  end

end
