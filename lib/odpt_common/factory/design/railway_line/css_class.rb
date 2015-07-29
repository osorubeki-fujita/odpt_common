class OdptCommon::Factory::Design::RailwayLine::CssClass < OdptCommon::Factory::Design::Fundamental::CssClass

  def initialize( object , i )
    super( object , :name_en_with_operator_name )
    @num = i
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

    elsif @object.odakyu_line?
      str = "odakyu_line"
    elsif @object.on_tobu_skytree_line_with_through_operation_infos?
      str = super()

    elsif @object.has_many_code_infos?
      str = super()
      if @num == 0
        str = "#{ super() }_1"
      else
        str = "#{ super() }_#{ @num }"
      end

    else
      str = super()
    end

    return str
  end

end
