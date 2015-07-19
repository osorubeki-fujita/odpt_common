module OdptCommon::Modules::Name::Common::TrainType::CssClass

  # @!group CSS に関するメソッド

  def css_class
    ::OdptCommon::Factory::Design::TrainType::CssClass.process( self )
  end

  # @!endgroup

end
