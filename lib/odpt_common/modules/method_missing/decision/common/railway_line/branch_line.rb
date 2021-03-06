module OdptCommon::Modules::MethodMissing::Decision::Common::RailwayLine::BranchLine

  private

  def method_missing( method_name , *args )
    if args.empty?
      if /\A((?:is|is_not|not)_)?branch(?:_railway)?(?:_line)?(?:_info)?\?\Z/ =~ method_name.to_s
        valid_method_name = "is_" + $1.to_s.gsub( /is_/ , "" ) + "branch_railway_line_info?"
        return send( valid_method_name )
      elsif /\Ahas_branch(?:_railway)?(?:_line)?(?:_infos)?\?\Z/ =~ method_name.to_s
        valid_method_name = "has_branch_railway_line_infos?"
        return send( valid_method_name )
      end
    end
    super( method_name , *args )
  end

end
