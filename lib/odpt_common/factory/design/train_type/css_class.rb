class OdptCommon::Factory::Design::TrainType::CssClass <  OdptCommon::Factory::Design::Fundamental::MetaClass

  def to_s
    regexp = /\Acustom\.TrainType\:(?:[a-zA-Z]+)\.(?:[a-zA-Z]+)\./
    same_as.gsub( regexp , "" ).gsub( /\./ , "_" ).underscore
  end

end
