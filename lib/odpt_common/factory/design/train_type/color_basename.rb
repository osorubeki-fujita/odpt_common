class OdptCommon::Factory::Design::TrainType::ColorBasename < OdptCommon::Factory::Design::Fundamental::MetaClass

  def initialize( object , regexp_to_delete_operator_name = nil )
    super( object )
    @regexp_to_delete_operator_name = regexp_to_delete_operator_name
  end

  #/\ATokyoMetro\./

  def to_s
    raise unless @regexp_to_delete_operator_name.regexp?
    "train_type_" + same_as.gsub( /\Acustom\.TrainType\:/ , "" ).gsub( @regexp_to_delete_operator_name , "").gsub( "\." , "_" ).underscore.downcase
  end

end
