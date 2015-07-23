module OdptCommon::Factory::MetaProcessor::ForProcess

  extend ::ActiveSupport::Concern

  module ClassMethods

    def process( *args )
      self.new( *args ).process
      return nil
    end

  end

  def process
    raise "This method '#{ __method__ }' is not defined in this class '#{ self.class.name }'."
  end

end
