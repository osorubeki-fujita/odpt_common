module OdptCommon::Factory::MetaProcessor::ForProcess

  def self.process( *args )
    self.new( *args ).process
    return nil
  end

  def process
    raise "This method '#{ __method__ }' is not defined in this class '#{ self.class.name }'."
  end

end
