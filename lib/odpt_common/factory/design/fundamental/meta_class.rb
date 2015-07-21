class OdptCommon::Factory::Design::Fundamental::MetaClass

  def initialize( object )
    @object = object
  end

  def self.process( *args )
    return self.new( *args ).to_s
  end

  def to_s
    raise "This method '#{ __method__ }' is not defined in this class '#{ self.class.name }'."
  end

  private

  def same_as
    @object.same_as
  end

end
