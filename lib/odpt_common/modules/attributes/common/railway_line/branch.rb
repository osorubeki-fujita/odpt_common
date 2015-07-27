module OdptCommon::Modules::Attributes::Common::RailwayLine::Branch

  # @!group 支線

  def is_not_branch_railway_line_info?
    !( is_branch_railway_line_info? )
  end

  #@!endgroup

end
