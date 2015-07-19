class OdptCommon::Factory::Design::Fundamental::MetaClass

  def initialize( object )
    @object = object
  end

  def self.process( *args )
    self.new( *args ).to_s
  end

  private

  def same_as
    @object.same_as
  end

end
